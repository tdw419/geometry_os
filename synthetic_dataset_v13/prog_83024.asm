; DESCRIPTION: Renders a purple line between points (167, 144) and (142, 180).
; PLAN: r0=167(x1), r1=144(y1), r2=142(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 144
LDI r2, 142
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
