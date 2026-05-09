; DESCRIPTION: Renders a purple line between points (135, 151) and (328, 115).
; PLAN: r0=135(x1), r1=151(y1), r2=328(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 151
LDI r2, 328
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
