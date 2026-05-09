; DESCRIPTION: Places a magenta line segment connecting (499, 136) to (47, 90).
; PLAN: r0=499(x1), r1=136(y1), r2=47(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 136
LDI r2, 47
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
