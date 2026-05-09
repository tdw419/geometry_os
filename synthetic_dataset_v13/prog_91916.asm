; DESCRIPTION: Places a purple line segment connecting (85, 134) to (474, 93).
; PLAN: r0=85(x1), r1=134(y1), r2=474(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 134
LDI r2, 474
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
