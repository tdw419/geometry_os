; DESCRIPTION: Places a purple line segment connecting (150, 136) to (11, 60).
; PLAN: r0=150(x1), r1=136(y1), r2=11(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 136
LDI r2, 11
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
