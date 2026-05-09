; DESCRIPTION: Draws a blue line from (120, 43) to (447, 133).
; PLAN: r0=120(x1), r1=43(y1), r2=447(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 43
LDI r2, 447
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
