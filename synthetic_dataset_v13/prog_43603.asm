; DESCRIPTION: Composite: Creates a green circular shape at (368, 123) with radius 69 then Places a black line segment connecting (378, 254) to (62, 69).
; PLAN: r0=368(x), r1=123(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=254(y1), r7=62(x2), r8=69(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 123
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 254
LDI r7, 62
LDI r8, 69
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
