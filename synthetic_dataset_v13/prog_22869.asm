; DESCRIPTION: Renders a purple line between points (495, 247) and (151, 62).
; PLAN: r0=495(x1), r1=247(y1), r2=151(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 247
LDI r2, 151
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
