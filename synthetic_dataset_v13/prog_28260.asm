; DESCRIPTION: Composite: Creates a blue circular shape at (163, 25) with radius 12 then Places a green line segment connecting (41, 201) to (478, 253).
; PLAN: r0=163(x), r1=25(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=201(y1), r7=478(x2), r8=253(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 25
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 201
LDI r7, 478
LDI r8, 253
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
