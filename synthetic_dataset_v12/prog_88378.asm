; DESCRIPTION: Places a magenta line segment connecting (424, 148) to (462, 169).
; PLAN: r0=424(x1), r1=148(y1), r2=462(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 148
LDI r2, 462
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
