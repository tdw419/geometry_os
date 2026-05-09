; DESCRIPTION: Places a purple line segment connecting (2, 209) to (110, 219).
; PLAN: r0=2(x1), r1=209(y1), r2=110(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 209
LDI r2, 110
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
