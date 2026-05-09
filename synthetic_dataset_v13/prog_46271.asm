; DESCRIPTION: Draws a blue line from (338, 75) to (397, 211).
; PLAN: r0=338(x1), r1=75(y1), r2=397(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 75
LDI r2, 397
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
