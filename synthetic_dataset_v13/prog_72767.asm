; DESCRIPTION: Places a magenta line segment connecting (53, 118) to (245, 70).
; PLAN: r0=53(x1), r1=118(y1), r2=245(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 118
LDI r2, 245
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
