; DESCRIPTION: Places a blue line segment connecting (177, 139) to (331, 97).
; PLAN: r0=177(x1), r1=139(y1), r2=331(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 139
LDI r2, 331
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
