; DESCRIPTION: Places a magenta line segment connecting (73, 7) to (62, 139).
; PLAN: r0=73(x1), r1=7(y1), r2=62(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 7
LDI r2, 62
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
