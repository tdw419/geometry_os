; DESCRIPTION: Composite: Renders a green line between points (72, 186) and (453, 171) then Creates a orange circular shape at (341, 106) with radius 71 then Places a purple dot at position (100, 21).
; PLAN: r0=72(x1), r1=186(y1), r2=453(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=106(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=21(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 186
LDI r2, 453
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 106
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 21
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
