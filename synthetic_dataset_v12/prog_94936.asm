; DESCRIPTION: Renders a blue line between points (312, 122) and (99, 60).
; PLAN: r0=312(x1), r1=122(y1), r2=99(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 122
LDI r2, 99
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
