; DESCRIPTION: Places a magenta line segment connecting (313, 142) to (5, 110).
; PLAN: r0=313(x1), r1=142(y1), r2=5(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 142
LDI r2, 5
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
