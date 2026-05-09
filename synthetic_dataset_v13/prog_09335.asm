; DESCRIPTION: Places a purple line segment connecting (151, 40) to (399, 64).
; PLAN: r0=151(x1), r1=40(y1), r2=399(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 40
LDI r2, 399
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
