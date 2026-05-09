; DESCRIPTION: Draws a orange line from (231, 98) to (338, 206).
; PLAN: r0=231(x1), r1=98(y1), r2=338(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 98
LDI r2, 338
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
