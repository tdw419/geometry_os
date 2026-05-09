; DESCRIPTION: Renders a magenta line between points (117, 36) and (270, 119).
; PLAN: r0=117(x1), r1=36(y1), r2=270(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 36
LDI r2, 270
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
