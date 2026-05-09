; DESCRIPTION: Renders a blue line between points (447, 90) and (124, 193).
; PLAN: r0=447(x1), r1=90(y1), r2=124(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 90
LDI r2, 124
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
