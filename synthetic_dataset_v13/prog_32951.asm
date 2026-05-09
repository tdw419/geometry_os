; DESCRIPTION: Renders a magenta line between points (448, 127) and (98, 153).
; PLAN: r0=448(x1), r1=127(y1), r2=98(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 127
LDI r2, 98
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
