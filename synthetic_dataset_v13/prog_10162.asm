; DESCRIPTION: Composite: Places a blue line segment connecting (86, 142) to (338, 24) then Sets a single white pixel at (505, 25) then Renders a orange disk with center (232, 154) and radius 70.
; PLAN: r0=86(x1), r1=142(y1), r2=338(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=25(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=154(y), r12=70(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 142
LDI r2, 338
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 25
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 232
LDI r11, 154
LDI r12, 70
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
