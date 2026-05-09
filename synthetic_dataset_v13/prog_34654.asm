; DESCRIPTION: Places a magenta line segment connecting (119, 69) to (9, 199).
; PLAN: r0=119(x1), r1=69(y1), r2=9(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 69
LDI r2, 9
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
