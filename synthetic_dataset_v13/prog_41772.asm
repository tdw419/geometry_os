; DESCRIPTION: Composite: Renders a black line between points (483, 9) and (384, 179) then Places a orange dot at position (235, 40).
; PLAN: r0=483(x1), r1=9(y1), r2=384(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=40(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 483
LDI r1, 9
LDI r2, 384
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 40
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
