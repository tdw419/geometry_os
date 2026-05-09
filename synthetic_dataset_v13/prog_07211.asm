; DESCRIPTION: Places a magenta line segment connecting (390, 5) to (53, 91).
; PLAN: r0=390(x1), r1=5(y1), r2=53(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 5
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
