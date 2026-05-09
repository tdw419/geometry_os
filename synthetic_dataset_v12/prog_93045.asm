; DESCRIPTION: Renders a purple line between points (300, 38) and (99, 18).
; PLAN: r0=300(x1), r1=38(y1), r2=99(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 38
LDI r2, 99
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
