; DESCRIPTION: Places a purple line segment connecting (255, 156) to (401, 7).
; PLAN: r0=255(x1), r1=156(y1), r2=401(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 156
LDI r2, 401
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
