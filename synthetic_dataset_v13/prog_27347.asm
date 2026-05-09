; DESCRIPTION: Composite: Places a orange line segment connecting (204, 54) to (54, 8) then Creates a blue circular shape at (448, 175) with radius 38.
; PLAN: r0=204(x1), r1=54(y1), r2=54(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=175(y), r7=38(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 204
LDI r1, 54
LDI r2, 54
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 175
LDI r7, 38
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
