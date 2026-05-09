; DESCRIPTION: Places a purple line segment connecting (490, 214) to (260, 138).
; PLAN: r0=490(x1), r1=214(y1), r2=260(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 214
LDI r2, 260
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
