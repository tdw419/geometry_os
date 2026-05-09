; DESCRIPTION: Places a magenta line segment connecting (55, 178) to (181, 149).
; PLAN: r0=55(x1), r1=178(y1), r2=181(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 178
LDI r2, 181
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
