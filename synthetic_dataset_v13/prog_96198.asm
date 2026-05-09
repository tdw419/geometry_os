; DESCRIPTION: Composite: Creates a yellow circular shape at (395, 119) with radius 38 then Places a blue line segment connecting (23, 20) to (21, 158).
; PLAN: r0=395(x), r1=119(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x1), r6=20(y1), r7=21(x2), r8=158(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 119
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 20
LDI r7, 21
LDI r8, 158
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
