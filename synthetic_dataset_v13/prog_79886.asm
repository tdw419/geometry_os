; DESCRIPTION: Places a red line segment connecting (109, 140) to (455, 56).
; PLAN: r0=109(x1), r1=140(y1), r2=455(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 140
LDI r2, 455
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
