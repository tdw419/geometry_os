; DESCRIPTION: Composite: Places a purple line segment connecting (161, 100) to (507, 164) then Draws a yellow circle centered at (257, 70) with radius 54.
; PLAN: r0=161(x1), r1=100(y1), r2=507(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=70(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 100
LDI r2, 507
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 70
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
