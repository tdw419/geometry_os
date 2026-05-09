; DESCRIPTION: Composite: Places a orange dot at position (432, 254) then Renders a white line between points (461, 103) and (235, 217).
; PLAN: r0=432(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=103(y1), r7=235(x2), r8=217(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 461
LDI r6, 103
LDI r7, 235
LDI r8, 217
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
