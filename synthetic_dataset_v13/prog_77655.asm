; DESCRIPTION: Places a purple line segment connecting (288, 178) to (113, 219).
; PLAN: r0=288(x1), r1=178(y1), r2=113(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 178
LDI r2, 113
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
