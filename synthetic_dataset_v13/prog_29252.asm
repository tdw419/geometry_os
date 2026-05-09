; DESCRIPTION: Places a magenta line segment connecting (28, 189) to (155, 135).
; PLAN: r0=28(x1), r1=189(y1), r2=155(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 189
LDI r2, 155
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
