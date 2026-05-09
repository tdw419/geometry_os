; DESCRIPTION: Draws a blue line from (447, 81) to (191, 211).
; PLAN: r0=447(x1), r1=81(y1), r2=191(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 81
LDI r2, 191
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
