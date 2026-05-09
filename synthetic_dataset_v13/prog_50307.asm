; DESCRIPTION: Renders a magenta line between points (216, 247) and (426, 69).
; PLAN: r0=216(x1), r1=247(y1), r2=426(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 247
LDI r2, 426
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
