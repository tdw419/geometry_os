; DESCRIPTION: Renders a magenta line between points (270, 230) and (155, 57).
; PLAN: r0=270(x1), r1=230(y1), r2=155(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 230
LDI r2, 155
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
