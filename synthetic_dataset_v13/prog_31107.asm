; DESCRIPTION: Places a purple line segment connecting (192, 86) to (410, 188).
; PLAN: r0=192(x1), r1=86(y1), r2=410(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 86
LDI r2, 410
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
