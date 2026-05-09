; DESCRIPTION: Composite: Places a white circle of radius 68 at center (253, 109) then Renders a magenta line between points (114, 246) and (453, 89) then Sets a single orange pixel at (11, 203).
; PLAN: r0=253(x), r1=109(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x1), r6=246(y1), r7=453(x2), r8=89(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=203(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 109
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 246
LDI r7, 453
LDI r8, 89
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 203
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
