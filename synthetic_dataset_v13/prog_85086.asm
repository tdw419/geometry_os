; DESCRIPTION: Draws a orange line from (90, 76) to (397, 211).
; PLAN: r0=90(x1), r1=76(y1), r2=397(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 76
LDI r2, 397
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
