; DESCRIPTION: Places a magenta line segment connecting (212, 167) to (31, 102).
; PLAN: r0=212(x1), r1=167(y1), r2=31(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 167
LDI r2, 31
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
