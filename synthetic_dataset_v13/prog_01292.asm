; DESCRIPTION: Draws a blue line from (312, 183) to (230, 244).
; PLAN: r0=312(x1), r1=183(y1), r2=230(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 183
LDI r2, 230
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
