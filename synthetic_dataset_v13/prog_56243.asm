; DESCRIPTION: Renders a purple line between points (328, 12) and (21, 136).
; PLAN: r0=328(x1), r1=12(y1), r2=21(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 12
LDI r2, 21
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
