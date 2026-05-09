; DESCRIPTION: Composite: Places a blue circle of radius 31 at center (317, 32) then Places a orange line segment connecting (350, 232) to (462, 116).
; PLAN: r0=317(x), r1=32(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=232(y1), r7=462(x2), r8=116(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 32
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 232
LDI r7, 462
LDI r8, 116
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
