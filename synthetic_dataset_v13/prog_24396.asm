; DESCRIPTION: Places a purple line segment connecting (43, 240) to (145, 117).
; PLAN: r0=43(x1), r1=240(y1), r2=145(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 240
LDI r2, 145
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
