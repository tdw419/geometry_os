; DESCRIPTION: Draws a blue line from (112, 167) to (476, 250).
; PLAN: r0=112(x1), r1=167(y1), r2=476(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 167
LDI r2, 476
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
