; DESCRIPTION: Composite: Renders a blue disk with center (123, 109) and radius 12 then Sets a single purple pixel at (290, 228) then Renders a white line between points (107, 167) and (81, 55).
; PLAN: r0=123(x), r1=109(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=290(x), r6=228(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=107(x1), r11=167(y1), r12=81(x2), r13=55(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 109
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 290
LDI r6, 228
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 167
LDI r12, 81
LDI r13, 55
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
