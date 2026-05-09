; DESCRIPTION: Renders a purple line between points (385, 185) and (280, 48).
; PLAN: r0=385(x1), r1=185(y1), r2=280(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 185
LDI r2, 280
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
