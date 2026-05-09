; DESCRIPTION: Renders a purple line between points (132, 133) and (460, 73).
; PLAN: r0=132(x1), r1=133(y1), r2=460(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 133
LDI r2, 460
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
