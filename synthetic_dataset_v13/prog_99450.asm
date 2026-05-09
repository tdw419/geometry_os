; DESCRIPTION: Composite: Renders a purple line between points (453, 135) and (247, 242) then Places a white dot at position (25, 163) then Renders a blue disk with center (230, 105) and radius 64.
; PLAN: r0=453(x1), r1=135(y1), r2=247(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=163(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=105(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 135
LDI r2, 247
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 163
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 230
LDI r11, 105
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
