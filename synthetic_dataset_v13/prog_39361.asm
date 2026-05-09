; DESCRIPTION: Places a purple line segment connecting (161, 96) to (263, 99).
; PLAN: r0=161(x1), r1=96(y1), r2=263(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 96
LDI r2, 263
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
