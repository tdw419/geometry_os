; DESCRIPTION: Places a magenta line segment connecting (45, 225) to (343, 25).
; PLAN: r0=45(x1), r1=225(y1), r2=343(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 225
LDI r2, 343
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
