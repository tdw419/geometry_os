; DESCRIPTION: Places a magenta line segment connecting (69, 110) to (88, 52).
; PLAN: r0=69(x1), r1=110(y1), r2=88(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 110
LDI r2, 88
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
