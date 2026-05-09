; DESCRIPTION: Places a magenta line segment connecting (461, 69) to (85, 54).
; PLAN: r0=461(x1), r1=69(y1), r2=85(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 69
LDI r2, 85
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
