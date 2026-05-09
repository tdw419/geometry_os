; DESCRIPTION: Places a magenta line segment connecting (48, 10) to (343, 15).
; PLAN: r0=48(x1), r1=10(y1), r2=343(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 10
LDI r2, 343
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
