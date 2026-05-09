; DESCRIPTION: Composite: Renders a orange line between points (291, 92) and (121, 67) then Creates a purple circular shape at (254, 110) with radius 36.
; PLAN: r0=291(x1), r1=92(y1), r2=121(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=110(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 291
LDI r1, 92
LDI r2, 121
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 110
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
