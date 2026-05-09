; DESCRIPTION: Places a purple line segment connecting (333, 100) to (225, 93).
; PLAN: r0=333(x1), r1=100(y1), r2=225(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 100
LDI r2, 225
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
