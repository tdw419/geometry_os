; DESCRIPTION: Places a magenta line segment connecting (46, 207) to (302, 81).
; PLAN: r0=46(x1), r1=207(y1), r2=302(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 207
LDI r2, 302
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
