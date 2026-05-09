; DESCRIPTION: Draws a orange line from (91, 176) to (351, 166).
; PLAN: r0=91(x1), r1=176(y1), r2=351(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 176
LDI r2, 351
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
