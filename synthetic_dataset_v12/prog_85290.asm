; DESCRIPTION: Places a purple line segment connecting (209, 175) to (1, 184).
; PLAN: r0=209(x1), r1=175(y1), r2=1(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 175
LDI r2, 1
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
