; DESCRIPTION: Places a blue line segment connecting (294, 138) to (118, 140).
; PLAN: r0=294(x1), r1=138(y1), r2=118(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 138
LDI r2, 118
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
