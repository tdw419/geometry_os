; DESCRIPTION: Renders a blue line between points (316, 121) and (78, 60).
; PLAN: r0=316(x1), r1=121(y1), r2=78(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 121
LDI r2, 78
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
