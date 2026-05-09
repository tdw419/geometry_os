; DESCRIPTION: Draws a orange line from (431, 171) to (429, 180).
; PLAN: r0=431(x1), r1=171(y1), r2=429(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 171
LDI r2, 429
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
