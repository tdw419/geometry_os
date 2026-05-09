; DESCRIPTION: Draws a orange line from (244, 185) to (212, 73).
; PLAN: r0=244(x1), r1=185(y1), r2=212(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 185
LDI r2, 212
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
