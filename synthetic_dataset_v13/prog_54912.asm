; DESCRIPTION: Renders a purple line between points (59, 140) and (74, 219).
; PLAN: r0=59(x1), r1=140(y1), r2=74(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 140
LDI r2, 74
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
