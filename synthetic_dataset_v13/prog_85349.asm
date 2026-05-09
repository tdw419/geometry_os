; DESCRIPTION: Renders a magenta line between points (496, 178) and (110, 97).
; PLAN: r0=496(x1), r1=178(y1), r2=110(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 178
LDI r2, 110
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
