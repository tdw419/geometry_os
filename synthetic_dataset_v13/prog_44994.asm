; DESCRIPTION: Places a magenta line segment connecting (508, 38) to (167, 194).
; PLAN: r0=508(x1), r1=38(y1), r2=167(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 38
LDI r2, 167
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
