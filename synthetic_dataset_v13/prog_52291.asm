; DESCRIPTION: Draws a orange line from (207, 227) to (361, 244).
; PLAN: r0=207(x1), r1=227(y1), r2=361(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 227
LDI r2, 361
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
