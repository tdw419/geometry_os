; DESCRIPTION: Composite: Creates a black circular shape at (375, 95) with radius 24 then Places a black line segment connecting (52, 245) to (137, 145).
; PLAN: r0=375(x), r1=95(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x1), r6=245(y1), r7=137(x2), r8=145(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 95
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 245
LDI r7, 137
LDI r8, 145
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
