; DESCRIPTION: Places a purple line segment connecting (333, 127) to (199, 106).
; PLAN: r0=333(x1), r1=127(y1), r2=199(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 127
LDI r2, 199
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
