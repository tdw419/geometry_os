; DESCRIPTION: Draws a blue line from (337, 84) to (253, 218).
; PLAN: r0=337(x1), r1=84(y1), r2=253(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 84
LDI r2, 253
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
