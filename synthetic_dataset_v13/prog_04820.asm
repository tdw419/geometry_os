; DESCRIPTION: Places a purple line segment connecting (345, 151) to (328, 73).
; PLAN: r0=345(x1), r1=151(y1), r2=328(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 151
LDI r2, 328
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
