; DESCRIPTION: Places a magenta line segment connecting (470, 37) to (339, 156).
; PLAN: r0=470(x1), r1=37(y1), r2=339(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 37
LDI r2, 339
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
