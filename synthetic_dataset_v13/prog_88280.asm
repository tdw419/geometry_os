; DESCRIPTION: Renders a magenta line between points (104, 216) and (105, 101).
; PLAN: r0=104(x1), r1=216(y1), r2=105(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 216
LDI r2, 105
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
