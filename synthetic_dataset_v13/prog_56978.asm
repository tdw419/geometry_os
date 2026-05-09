; DESCRIPTION: Places a magenta line segment connecting (140, 214) to (101, 109).
; PLAN: r0=140(x1), r1=214(y1), r2=101(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 214
LDI r2, 101
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
