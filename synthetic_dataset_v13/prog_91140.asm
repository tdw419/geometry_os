; DESCRIPTION: Renders a magenta line between points (138, 145) and (13, 110).
; PLAN: r0=138(x1), r1=145(y1), r2=13(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 145
LDI r2, 13
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
