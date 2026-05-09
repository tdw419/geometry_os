; DESCRIPTION: Places a purple line segment connecting (432, 29) to (480, 193).
; PLAN: r0=432(x1), r1=29(y1), r2=480(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 29
LDI r2, 480
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
