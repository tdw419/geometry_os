; DESCRIPTION: Renders a purple line between points (6, 8) and (503, 107).
; PLAN: r0=6(x1), r1=8(y1), r2=503(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 8
LDI r2, 503
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
