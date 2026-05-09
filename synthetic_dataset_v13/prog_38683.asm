; DESCRIPTION: Places a purple line segment connecting (510, 51) to (57, 137).
; PLAN: r0=510(x1), r1=51(y1), r2=57(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 51
LDI r2, 57
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
