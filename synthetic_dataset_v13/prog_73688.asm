; DESCRIPTION: Renders a purple line between points (191, 126) and (135, 180).
; PLAN: r0=191(x1), r1=126(y1), r2=135(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 126
LDI r2, 135
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
