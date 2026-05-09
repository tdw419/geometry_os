; DESCRIPTION: Renders a magenta line between points (94, 60) and (22, 99).
; PLAN: r0=94(x1), r1=60(y1), r2=22(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 60
LDI r2, 22
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
