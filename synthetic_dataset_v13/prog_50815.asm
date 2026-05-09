; DESCRIPTION: Renders a magenta line between points (448, 36) and (442, 102).
; PLAN: r0=448(x1), r1=36(y1), r2=442(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 36
LDI r2, 442
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
