; DESCRIPTION: Places a blue line segment connecting (463, 121) to (400, 114).
; PLAN: r0=463(x1), r1=121(y1), r2=400(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 121
LDI r2, 400
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
