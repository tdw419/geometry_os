; DESCRIPTION: Renders a purple line between points (156, 24) and (72, 218).
; PLAN: r0=156(x1), r1=24(y1), r2=72(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 24
LDI r2, 72
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
