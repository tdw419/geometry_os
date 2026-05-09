; DESCRIPTION: Places a purple line segment connecting (221, 224) to (410, 12).
; PLAN: r0=221(x1), r1=224(y1), r2=410(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 224
LDI r2, 410
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
