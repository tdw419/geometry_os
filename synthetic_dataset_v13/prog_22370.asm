; DESCRIPTION: Composite: Draws a white line from (309, 34) to (53, 137) then Sets a single blue pixel at (375, 5).
; PLAN: r0=309(x1), r1=34(y1), r2=53(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=5(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 34
LDI r2, 53
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 5
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
