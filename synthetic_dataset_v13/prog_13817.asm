; DESCRIPTION: Renders a magenta line between points (279, 139) and (122, 220).
; PLAN: r0=279(x1), r1=139(y1), r2=122(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 139
LDI r2, 122
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
