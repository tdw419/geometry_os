; DESCRIPTION: Composite: Sets a single orange pixel at (310, 204) then Draws a green line from (430, 23) to (155, 58).
; PLAN: r0=310(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=430(x1), r6=23(y1), r7=155(x2), r8=58(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 430
LDI r6, 23
LDI r7, 155
LDI r8, 58
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
