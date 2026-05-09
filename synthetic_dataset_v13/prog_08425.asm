; DESCRIPTION: Draws a orange line from (204, 234) to (96, 87).
; PLAN: r0=204(x1), r1=234(y1), r2=96(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 234
LDI r2, 96
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
