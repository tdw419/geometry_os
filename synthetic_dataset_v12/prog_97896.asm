; DESCRIPTION: Places a purple line segment connecting (345, 80) to (103, 132).
; PLAN: r0=345(x1), r1=80(y1), r2=103(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 80
LDI r2, 103
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
