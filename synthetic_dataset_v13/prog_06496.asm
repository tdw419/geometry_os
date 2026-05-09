; DESCRIPTION: Places a magenta line segment connecting (452, 88) to (446, 140).
; PLAN: r0=452(x1), r1=88(y1), r2=446(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 88
LDI r2, 446
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
