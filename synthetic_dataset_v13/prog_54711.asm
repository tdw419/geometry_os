; DESCRIPTION: Places a purple line segment connecting (434, 53) to (79, 1).
; PLAN: r0=434(x1), r1=53(y1), r2=79(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 53
LDI r2, 79
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
