; DESCRIPTION: Draws a orange line from (378, 245) to (178, 22).
; PLAN: r0=378(x1), r1=245(y1), r2=178(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 245
LDI r2, 178
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
