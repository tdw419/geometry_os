; DESCRIPTION: Renders a magenta line between points (279, 43) and (4, 57).
; PLAN: r0=279(x1), r1=43(y1), r2=4(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 43
LDI r2, 4
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
