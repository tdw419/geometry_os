; DESCRIPTION: Renders a purple line between points (491, 186) and (387, 136).
; PLAN: r0=491(x1), r1=186(y1), r2=387(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 186
LDI r2, 387
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
