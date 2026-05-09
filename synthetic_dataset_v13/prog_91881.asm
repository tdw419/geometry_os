; DESCRIPTION: Draws a blue line from (278, 232) to (426, 233).
; PLAN: r0=278(x1), r1=232(y1), r2=426(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 232
LDI r2, 426
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
