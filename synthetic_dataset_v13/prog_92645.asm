; DESCRIPTION: Renders a purple line between points (450, 189) and (385, 243).
; PLAN: r0=450(x1), r1=189(y1), r2=385(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 189
LDI r2, 385
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
