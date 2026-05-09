; DESCRIPTION: Places a purple line segment connecting (39, 96) to (356, 175).
; PLAN: r0=39(x1), r1=96(y1), r2=356(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 96
LDI r2, 356
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
