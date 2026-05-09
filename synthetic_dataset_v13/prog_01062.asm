; DESCRIPTION: Composite: Places a black line segment connecting (477, 54) to (85, 69) then Places a magenta circle of radius 11 at center (484, 39).
; PLAN: r0=477(x1), r1=54(y1), r2=85(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=39(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 54
LDI r2, 85
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 39
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
