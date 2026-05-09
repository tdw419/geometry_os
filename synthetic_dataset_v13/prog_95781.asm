; DESCRIPTION: Places a magenta line segment connecting (106, 28) to (142, 170).
; PLAN: r0=106(x1), r1=28(y1), r2=142(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 28
LDI r2, 142
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
