; DESCRIPTION: Composite: Renders a green disk with center (291, 216) and radius 36 then Places a green line segment connecting (155, 204) to (40, 41).
; PLAN: r0=291(x), r1=216(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=204(y1), r7=40(x2), r8=41(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 216
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 204
LDI r7, 40
LDI r8, 41
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
