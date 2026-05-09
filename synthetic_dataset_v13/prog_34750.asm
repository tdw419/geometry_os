; DESCRIPTION: Draws a orange line from (397, 32) to (315, 121).
; PLAN: r0=397(x1), r1=32(y1), r2=315(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 32
LDI r2, 315
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
