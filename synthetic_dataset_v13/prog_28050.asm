; DESCRIPTION: Renders a purple line between points (43, 36) and (299, 135).
; PLAN: r0=43(x1), r1=36(y1), r2=299(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 36
LDI r2, 299
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
