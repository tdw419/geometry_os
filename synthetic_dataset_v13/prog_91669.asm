; DESCRIPTION: Composite: Creates a purple circular shape at (282, 161) with radius 62 then Places a orange line segment connecting (200, 110) to (253, 56).
; PLAN: r0=282(x), r1=161(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=110(y1), r7=253(x2), r8=56(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 161
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 110
LDI r7, 253
LDI r8, 56
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
