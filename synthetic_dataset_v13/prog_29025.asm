; DESCRIPTION: Places a purple line segment connecting (118, 99) to (235, 229).
; PLAN: r0=118(x1), r1=99(y1), r2=235(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 99
LDI r2, 235
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
