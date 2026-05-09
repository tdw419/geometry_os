; DESCRIPTION: Composite: Places a red line segment connecting (12, 235) to (438, 2) then Places a red dot at position (41, 238).
; PLAN: r0=12(x1), r1=235(y1), r2=438(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=238(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 235
LDI r2, 438
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 238
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
