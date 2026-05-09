; DESCRIPTION: Places a magenta line segment connecting (33, 101) to (271, 23).
; PLAN: r0=33(x1), r1=101(y1), r2=271(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 101
LDI r2, 271
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
