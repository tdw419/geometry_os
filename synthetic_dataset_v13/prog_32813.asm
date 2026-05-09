; DESCRIPTION: Draws a orange line from (367, 122) to (191, 185).
; PLAN: r0=367(x1), r1=122(y1), r2=191(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 122
LDI r2, 191
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
