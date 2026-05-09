; DESCRIPTION: Places a purple line segment connecting (195, 205) to (482, 61).
; PLAN: r0=195(x1), r1=205(y1), r2=482(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 205
LDI r2, 482
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
