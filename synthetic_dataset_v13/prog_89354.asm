; DESCRIPTION: Renders a blue line between points (467, 114) and (448, 68).
; PLAN: r0=467(x1), r1=114(y1), r2=448(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 114
LDI r2, 448
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
