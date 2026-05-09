; DESCRIPTION: Places a magenta line segment connecting (88, 204) to (149, 191).
; PLAN: r0=88(x1), r1=204(y1), r2=149(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 204
LDI r2, 149
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
