; DESCRIPTION: Composite: Draws a magenta line from (97, 85) to (471, 145) then Places a orange dot at position (43, 13).
; PLAN: r0=97(x1), r1=85(y1), r2=471(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 85
LDI r2, 471
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
