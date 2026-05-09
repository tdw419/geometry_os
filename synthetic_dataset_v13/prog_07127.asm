; DESCRIPTION: Places a magenta line segment connecting (139, 14) to (58, 62).
; PLAN: r0=139(x1), r1=14(y1), r2=58(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 14
LDI r2, 58
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
