; DESCRIPTION: Places a purple line segment connecting (145, 145) to (107, 166).
; PLAN: r0=145(x1), r1=145(y1), r2=107(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 145
LDI r2, 107
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
