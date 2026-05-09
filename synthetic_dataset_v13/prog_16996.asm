; DESCRIPTION: Places a purple line segment connecting (106, 196) to (236, 98).
; PLAN: r0=106(x1), r1=196(y1), r2=236(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 196
LDI r2, 236
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
