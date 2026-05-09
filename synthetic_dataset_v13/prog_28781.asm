; DESCRIPTION: Composite: Draws a black line from (411, 178) to (486, 170) then Creates a green circular shape at (289, 117) with radius 11.
; PLAN: r0=411(x1), r1=178(y1), r2=486(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=117(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 178
LDI r2, 486
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 117
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
