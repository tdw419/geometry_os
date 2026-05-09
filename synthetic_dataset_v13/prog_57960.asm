; DESCRIPTION: Composite: Places a black line segment connecting (287, 211) to (122, 204) then Sets a single black pixel at (247, 197).
; PLAN: r0=287(x1), r1=211(y1), r2=122(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=197(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 211
LDI r2, 122
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 197
LDI r7, 0x000000
PSET r5, r6, r7
HALT
