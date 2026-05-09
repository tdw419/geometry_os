; DESCRIPTION: Places a purple line segment connecting (105, 114) to (47, 152).
; PLAN: r0=105(x1), r1=114(y1), r2=47(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 114
LDI r2, 47
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
