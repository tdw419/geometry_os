; DESCRIPTION: Places a purple line segment connecting (134, 202) to (255, 19).
; PLAN: r0=134(x1), r1=202(y1), r2=255(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 202
LDI r2, 255
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
