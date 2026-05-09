; DESCRIPTION: Places a purple line segment connecting (324, 79) to (216, 173).
; PLAN: r0=324(x1), r1=79(y1), r2=216(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 79
LDI r2, 216
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
