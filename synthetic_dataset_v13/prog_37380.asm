; DESCRIPTION: Places a magenta line segment connecting (463, 186) to (343, 54).
; PLAN: r0=463(x1), r1=186(y1), r2=343(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 186
LDI r2, 343
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
