; DESCRIPTION: Places a purple line segment connecting (47, 242) to (371, 194).
; PLAN: r0=47(x1), r1=242(y1), r2=371(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 242
LDI r2, 371
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
