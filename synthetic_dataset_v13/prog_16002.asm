; DESCRIPTION: Places a magenta line segment connecting (139, 117) to (345, 92).
; PLAN: r0=139(x1), r1=117(y1), r2=345(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 117
LDI r2, 345
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
