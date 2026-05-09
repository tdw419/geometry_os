; DESCRIPTION: Renders a magenta line between points (155, 97) and (465, 10).
; PLAN: r0=155(x1), r1=97(y1), r2=465(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 97
LDI r2, 465
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
