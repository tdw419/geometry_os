; DESCRIPTION: Renders a magenta line between points (451, 25) and (65, 40).
; PLAN: r0=451(x1), r1=25(y1), r2=65(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 25
LDI r2, 65
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
