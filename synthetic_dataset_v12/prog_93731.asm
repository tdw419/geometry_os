; DESCRIPTION: Places a magenta line segment connecting (6, 95) to (373, 250).
; PLAN: r0=6(x1), r1=95(y1), r2=373(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 95
LDI r2, 373
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
