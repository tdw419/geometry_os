; DESCRIPTION: Renders a purple line between points (491, 133) and (466, 83).
; PLAN: r0=491(x1), r1=133(y1), r2=466(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 133
LDI r2, 466
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
