; DESCRIPTION: Renders a magenta line between points (24, 229) and (5, 217).
; PLAN: r0=24(x1), r1=229(y1), r2=5(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 229
LDI r2, 5
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
