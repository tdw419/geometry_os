; DESCRIPTION: Renders a magenta line between points (473, 3) and (185, 123).
; PLAN: r0=473(x1), r1=3(y1), r2=185(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 3
LDI r2, 185
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
