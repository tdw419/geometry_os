; DESCRIPTION: Renders a magenta line between points (160, 46) and (49, 145).
; PLAN: r0=160(x1), r1=46(y1), r2=49(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 46
LDI r2, 49
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
