; DESCRIPTION: Renders a purple line between points (363, 123) and (463, 28).
; PLAN: r0=363(x1), r1=123(y1), r2=463(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 123
LDI r2, 463
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
