; DESCRIPTION: Places a magenta line segment connecting (31, 167) to (101, 71).
; PLAN: r0=31(x1), r1=167(y1), r2=101(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 167
LDI r2, 101
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
