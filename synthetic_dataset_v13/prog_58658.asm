; DESCRIPTION: Renders a purple line between points (399, 122) and (133, 215).
; PLAN: r0=399(x1), r1=122(y1), r2=133(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 122
LDI r2, 133
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
