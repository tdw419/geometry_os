; DESCRIPTION: Renders a magenta line between points (279, 29) and (84, 35).
; PLAN: r0=279(x1), r1=29(y1), r2=84(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 29
LDI r2, 84
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
