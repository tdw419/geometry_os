; DESCRIPTION: Composite: Draws a white line from (289, 207) to (2, 201) then Places a black circle of radius 19 at center (208, 167).
; PLAN: r0=289(x1), r1=207(y1), r2=2(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=167(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 207
LDI r2, 2
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 167
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
