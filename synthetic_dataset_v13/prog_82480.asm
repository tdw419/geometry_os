; DESCRIPTION: Places a purple line segment connecting (196, 1) to (60, 61).
; PLAN: r0=196(x1), r1=1(y1), r2=60(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 1
LDI r2, 60
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
