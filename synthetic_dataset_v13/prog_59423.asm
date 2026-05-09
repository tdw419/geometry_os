; DESCRIPTION: Places a magenta line segment connecting (274, 90) to (399, 194).
; PLAN: r0=274(x1), r1=90(y1), r2=399(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 90
LDI r2, 399
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
