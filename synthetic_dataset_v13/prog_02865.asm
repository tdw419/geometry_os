; DESCRIPTION: Places a purple line segment connecting (365, 96) to (237, 216).
; PLAN: r0=365(x1), r1=96(y1), r2=237(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 96
LDI r2, 237
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
