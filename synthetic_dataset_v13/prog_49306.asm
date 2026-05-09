; DESCRIPTION: Composite: Renders a green line between points (232, 146) and (325, 137) then Draws a purple circle centered at (187, 88) with radius 47.
; PLAN: r0=232(x1), r1=146(y1), r2=325(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=88(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 146
LDI r2, 325
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 88
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
