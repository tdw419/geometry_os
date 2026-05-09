; DESCRIPTION: Places a magenta line segment connecting (232, 54) to (69, 185).
; PLAN: r0=232(x1), r1=54(y1), r2=69(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 54
LDI r2, 69
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
