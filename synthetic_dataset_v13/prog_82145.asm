; DESCRIPTION: Places a green line segment connecting (212, 181) to (169, 26).
; PLAN: r0=212(x1), r1=181(y1), r2=169(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 181
LDI r2, 169
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
