; DESCRIPTION: Draws a orange line from (397, 155) to (447, 227).
; PLAN: r0=397(x1), r1=155(y1), r2=447(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 155
LDI r2, 447
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
