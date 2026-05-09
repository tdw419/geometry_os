; DESCRIPTION: Places a purple line segment connecting (231, 32) to (357, 192).
; PLAN: r0=231(x1), r1=32(y1), r2=357(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 32
LDI r2, 357
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
