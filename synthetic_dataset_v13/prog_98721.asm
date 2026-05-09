; DESCRIPTION: Composite: Places a green line segment connecting (83, 141) to (471, 40) then Places a black dot at position (73, 159).
; PLAN: r0=83(x1), r1=141(y1), r2=471(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=159(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 141
LDI r2, 471
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 159
LDI r7, 0x000000
PSET r5, r6, r7
HALT
