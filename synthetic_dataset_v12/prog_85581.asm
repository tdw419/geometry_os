; DESCRIPTION: Renders a blue line between points (447, 38) and (175, 233).
; PLAN: r0=447(x1), r1=38(y1), r2=175(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 38
LDI r2, 175
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
