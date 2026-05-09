; DESCRIPTION: Renders a magenta line between points (328, 65) and (200, 97).
; PLAN: r0=328(x1), r1=65(y1), r2=200(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 65
LDI r2, 200
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
