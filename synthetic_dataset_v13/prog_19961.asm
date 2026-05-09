; DESCRIPTION: Places a purple line segment connecting (480, 251) to (291, 21).
; PLAN: r0=480(x1), r1=251(y1), r2=291(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 251
LDI r2, 291
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
