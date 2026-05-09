; DESCRIPTION: Composite: Places a orange line segment connecting (162, 62) to (442, 110) then Renders a yellow disk with center (317, 184) and radius 50.
; PLAN: r0=162(x1), r1=62(y1), r2=442(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=184(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 62
LDI r2, 442
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 184
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
