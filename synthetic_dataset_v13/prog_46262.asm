; DESCRIPTION: Composite: Draws a orange line from (336, 20) to (490, 116) then Creates a red circular shape at (216, 227) with radius 19.
; PLAN: r0=336(x1), r1=20(y1), r2=490(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=227(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 20
LDI r2, 490
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 227
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
