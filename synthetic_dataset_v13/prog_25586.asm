; DESCRIPTION: Places a blue line segment connecting (14, 93) to (407, 159).
; PLAN: r0=14(x1), r1=93(y1), r2=407(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 93
LDI r2, 407
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
