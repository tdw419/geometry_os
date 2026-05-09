; DESCRIPTION: Places a purple line segment connecting (247, 151) to (187, 80).
; PLAN: r0=247(x1), r1=151(y1), r2=187(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 151
LDI r2, 187
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
