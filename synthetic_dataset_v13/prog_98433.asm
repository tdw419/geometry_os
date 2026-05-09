; DESCRIPTION: Places a magenta line segment connecting (394, 170) to (88, 163).
; PLAN: r0=394(x1), r1=170(y1), r2=88(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 170
LDI r2, 88
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
