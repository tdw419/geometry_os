; DESCRIPTION: Renders a purple line between points (128, 133) and (486, 252).
; PLAN: r0=128(x1), r1=133(y1), r2=486(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 133
LDI r2, 486
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
