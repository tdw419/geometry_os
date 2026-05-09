; DESCRIPTION: Places a magenta line segment connecting (112, 67) to (84, 165).
; PLAN: r0=112(x1), r1=67(y1), r2=84(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 67
LDI r2, 84
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
