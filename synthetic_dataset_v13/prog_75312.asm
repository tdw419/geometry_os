; DESCRIPTION: Composite: Draws a orange line from (140, 199) to (122, 7) then Sets a single cyan pixel at (134, 148).
; PLAN: r0=140(x1), r1=199(y1), r2=122(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=148(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 199
LDI r2, 122
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 148
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
