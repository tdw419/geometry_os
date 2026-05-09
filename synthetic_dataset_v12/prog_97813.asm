; DESCRIPTION: Composite: Renders a orange line between points (461, 251) and (197, 186) then Sets a single cyan pixel at (471, 90).
; PLAN: r0=461(x1), r1=251(y1), r2=197(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=90(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 251
LDI r2, 197
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 90
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
