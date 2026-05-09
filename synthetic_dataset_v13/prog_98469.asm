; DESCRIPTION: Places a magenta line segment connecting (178, 105) to (140, 96).
; PLAN: r0=178(x1), r1=105(y1), r2=140(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 105
LDI r2, 140
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
