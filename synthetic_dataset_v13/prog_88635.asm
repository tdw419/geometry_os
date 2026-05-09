; DESCRIPTION: Places a purple line segment connecting (309, 118) to (199, 28).
; PLAN: r0=309(x1), r1=118(y1), r2=199(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 118
LDI r2, 199
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
