; DESCRIPTION: Renders a purple line between points (163, 206) and (285, 194).
; PLAN: r0=163(x1), r1=206(y1), r2=285(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 206
LDI r2, 285
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
