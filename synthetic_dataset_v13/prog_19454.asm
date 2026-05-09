; DESCRIPTION: Places a blue line segment connecting (118, 17) to (172, 25).
; PLAN: r0=118(x1), r1=17(y1), r2=172(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 17
LDI r2, 172
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
