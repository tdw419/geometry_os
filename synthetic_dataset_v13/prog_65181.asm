; DESCRIPTION: Renders a blue line between points (447, 226) and (282, 144).
; PLAN: r0=447(x1), r1=226(y1), r2=282(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 226
LDI r2, 282
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
