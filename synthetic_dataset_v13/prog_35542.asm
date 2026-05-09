; DESCRIPTION: Places a blue line segment connecting (426, 87) to (240, 219).
; PLAN: r0=426(x1), r1=87(y1), r2=240(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 87
LDI r2, 240
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
