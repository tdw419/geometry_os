; DESCRIPTION: Renders a purple line between points (63, 99) and (343, 178).
; PLAN: r0=63(x1), r1=99(y1), r2=343(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 343
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
