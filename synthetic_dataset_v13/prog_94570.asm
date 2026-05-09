; DESCRIPTION: Places a purple line segment connecting (115, 86) to (367, 38).
; PLAN: r0=115(x1), r1=86(y1), r2=367(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 86
LDI r2, 367
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
