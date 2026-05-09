; DESCRIPTION: Renders a magenta line between points (127, 1) and (279, 118).
; PLAN: r0=127(x1), r1=1(y1), r2=279(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 1
LDI r2, 279
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
