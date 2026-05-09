; DESCRIPTION: Draws a orange line from (299, 69) to (301, 112).
; PLAN: r0=299(x1), r1=69(y1), r2=301(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 69
LDI r2, 301
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
