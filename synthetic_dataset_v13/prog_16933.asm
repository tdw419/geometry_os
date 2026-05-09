; DESCRIPTION: Places a magenta line segment connecting (226, 99) to (101, 75).
; PLAN: r0=226(x1), r1=99(y1), r2=101(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 99
LDI r2, 101
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
