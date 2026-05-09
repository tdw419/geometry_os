; DESCRIPTION: Draws a purple line from (136, 133) to (83, 167).
; PLAN: r0=136(x1), r1=133(y1), r2=83(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 133
LDI r2, 83
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
