; DESCRIPTION: Places a magenta line segment connecting (341, 122) to (136, 71).
; PLAN: r0=341(x1), r1=122(y1), r2=136(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 122
LDI r2, 136
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
