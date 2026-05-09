; DESCRIPTION: Places a purple line segment connecting (98, 255) to (219, 32).
; PLAN: r0=98(x1), r1=255(y1), r2=219(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 255
LDI r2, 219
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
