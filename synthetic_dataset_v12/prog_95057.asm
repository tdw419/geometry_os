; DESCRIPTION: Places a blue line segment connecting (28, 208) to (19, 185).
; PLAN: r0=28(x1), r1=208(y1), r2=19(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 208
LDI r2, 19
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
