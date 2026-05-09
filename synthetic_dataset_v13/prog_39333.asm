; DESCRIPTION: Composite: Places a black line segment connecting (1, 198) to (406, 119) then Creates a orange circular shape at (436, 199) with radius 38.
; PLAN: r0=1(x1), r1=198(y1), r2=406(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=199(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 198
LDI r2, 406
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 199
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
