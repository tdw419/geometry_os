; DESCRIPTION: Places a purple line segment connecting (239, 139) to (0, 160).
; PLAN: r0=239(x1), r1=139(y1), r2=0(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 139
LDI r2, 0
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
