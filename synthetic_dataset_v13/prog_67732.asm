; DESCRIPTION: Places a purple line segment connecting (110, 103) to (30, 68).
; PLAN: r0=110(x1), r1=103(y1), r2=30(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 103
LDI r2, 30
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
