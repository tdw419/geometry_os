; DESCRIPTION: Composite: Places a green line segment connecting (351, 38) to (63, 201) then Places a white circle of radius 27 at center (375, 114).
; PLAN: r0=351(x1), r1=38(y1), r2=63(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=114(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 351
LDI r1, 38
LDI r2, 63
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 114
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
