; DESCRIPTION: Draws a purple line from (397, 133) to (344, 79).
; PLAN: r0=397(x1), r1=133(y1), r2=344(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 133
LDI r2, 344
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
