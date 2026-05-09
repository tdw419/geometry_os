; DESCRIPTION: Renders a blue line between points (164, 135) and (316, 100).
; PLAN: r0=164(x1), r1=135(y1), r2=316(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 135
LDI r2, 316
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
