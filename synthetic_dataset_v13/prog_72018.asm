; DESCRIPTION: Draws a purple line from (397, 5) to (62, 236).
; PLAN: r0=397(x1), r1=5(y1), r2=62(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 5
LDI r2, 62
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
