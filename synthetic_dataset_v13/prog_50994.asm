; DESCRIPTION: Renders a purple line between points (411, 123) and (385, 126).
; PLAN: r0=411(x1), r1=123(y1), r2=385(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 123
LDI r2, 385
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
