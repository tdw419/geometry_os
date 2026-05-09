; DESCRIPTION: Places a magenta line segment connecting (437, 139) to (205, 185).
; PLAN: r0=437(x1), r1=139(y1), r2=205(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 139
LDI r2, 205
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
