; DESCRIPTION: Places a magenta line segment connecting (472, 33) to (329, 205).
; PLAN: r0=472(x1), r1=33(y1), r2=329(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 33
LDI r2, 329
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
