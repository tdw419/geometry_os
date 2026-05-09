; DESCRIPTION: Renders a purple line between points (2, 68) and (447, 171).
; PLAN: r0=2(x1), r1=68(y1), r2=447(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 68
LDI r2, 447
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
