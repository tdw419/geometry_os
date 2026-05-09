; DESCRIPTION: Places a purple line segment connecting (77, 127) to (297, 44).
; PLAN: r0=77(x1), r1=127(y1), r2=297(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 127
LDI r2, 297
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
