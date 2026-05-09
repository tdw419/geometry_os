; DESCRIPTION: Places a green line segment connecting (109, 140) to (216, 112).
; PLAN: r0=109(x1), r1=140(y1), r2=216(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 140
LDI r2, 216
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
