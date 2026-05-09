; DESCRIPTION: Places a magenta line segment connecting (191, 227) to (26, 231).
; PLAN: r0=191(x1), r1=227(y1), r2=26(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 227
LDI r2, 26
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
