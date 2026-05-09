; DESCRIPTION: Places a magenta line segment connecting (339, 12) to (148, 208).
; PLAN: r0=339(x1), r1=12(y1), r2=148(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 12
LDI r2, 148
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
