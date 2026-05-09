; DESCRIPTION: Places a purple line segment connecting (248, 103) to (22, 252).
; PLAN: r0=248(x1), r1=103(y1), r2=22(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 103
LDI r2, 22
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
