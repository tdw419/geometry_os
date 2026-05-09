; DESCRIPTION: Draws a orange line from (429, 231) to (318, 137).
; PLAN: r0=429(x1), r1=231(y1), r2=318(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 231
LDI r2, 318
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
