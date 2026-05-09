; DESCRIPTION: Places a purple line segment connecting (255, 196) to (57, 230).
; PLAN: r0=255(x1), r1=196(y1), r2=57(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 196
LDI r2, 57
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
