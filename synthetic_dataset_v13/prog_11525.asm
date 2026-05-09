; DESCRIPTION: Composite: Draws a red line from (451, 124) to (195, 30) then Places a orange dot at position (2, 108).
; PLAN: r0=451(x1), r1=124(y1), r2=195(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=108(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 451
LDI r1, 124
LDI r2, 195
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 108
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
