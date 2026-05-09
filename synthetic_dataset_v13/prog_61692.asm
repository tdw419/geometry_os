; DESCRIPTION: Places a magenta line segment connecting (181, 146) to (339, 162).
; PLAN: r0=181(x1), r1=146(y1), r2=339(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 146
LDI r2, 339
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
