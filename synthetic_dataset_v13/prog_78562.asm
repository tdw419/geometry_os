; DESCRIPTION: Renders a blue line between points (447, 12) and (219, 183).
; PLAN: r0=447(x1), r1=12(y1), r2=219(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 12
LDI r2, 219
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
