; DESCRIPTION: Places a purple line segment connecting (192, 186) to (70, 108).
; PLAN: r0=192(x1), r1=186(y1), r2=70(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 186
LDI r2, 70
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
