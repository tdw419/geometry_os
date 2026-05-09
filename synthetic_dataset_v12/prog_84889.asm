; DESCRIPTION: Renders a magenta line between points (377, 9) and (324, 75).
; PLAN: r0=377(x1), r1=9(y1), r2=324(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 9
LDI r2, 324
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
