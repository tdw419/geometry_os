; DESCRIPTION: Draws a orange line from (343, 245) to (378, 37).
; PLAN: r0=343(x1), r1=245(y1), r2=378(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 245
LDI r2, 378
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
