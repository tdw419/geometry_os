; DESCRIPTION: Places a purple line segment connecting (94, 183) to (108, 209).
; PLAN: r0=94(x1), r1=183(y1), r2=108(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 183
LDI r2, 108
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
