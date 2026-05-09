; DESCRIPTION: Places a magenta line segment connecting (384, 66) to (132, 118).
; PLAN: r0=384(x1), r1=66(y1), r2=132(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 66
LDI r2, 132
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
