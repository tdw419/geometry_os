; DESCRIPTION: Places a magenta line segment connecting (110, 140) to (112, 172).
; PLAN: r0=110(x1), r1=140(y1), r2=112(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 140
LDI r2, 112
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
