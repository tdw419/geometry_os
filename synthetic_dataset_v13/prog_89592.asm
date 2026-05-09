; DESCRIPTION: Renders a purple line between points (25, 123) and (399, 38).
; PLAN: r0=25(x1), r1=123(y1), r2=399(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 123
LDI r2, 399
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
