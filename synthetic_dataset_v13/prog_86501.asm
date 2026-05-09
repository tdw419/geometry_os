; DESCRIPTION: Renders a purple line between points (447, 102) and (65, 173).
; PLAN: r0=447(x1), r1=102(y1), r2=65(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 102
LDI r2, 65
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
