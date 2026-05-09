; DESCRIPTION: Draws a orange line from (40, 26) to (351, 83).
; PLAN: r0=40(x1), r1=26(y1), r2=351(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 26
LDI r2, 351
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
