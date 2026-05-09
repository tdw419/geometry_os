; DESCRIPTION: Places a purple line segment connecting (305, 242) to (297, 217).
; PLAN: r0=305(x1), r1=242(y1), r2=297(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 242
LDI r2, 297
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
