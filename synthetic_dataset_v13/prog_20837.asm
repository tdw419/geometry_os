; DESCRIPTION: Places a magenta line segment connecting (93, 166) to (17, 97).
; PLAN: r0=93(x1), r1=166(y1), r2=17(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 166
LDI r2, 17
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
