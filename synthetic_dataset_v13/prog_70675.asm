; DESCRIPTION: Renders a purple line between points (302, 60) and (198, 203).
; PLAN: r0=302(x1), r1=60(y1), r2=198(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 60
LDI r2, 198
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
