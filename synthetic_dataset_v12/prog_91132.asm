; DESCRIPTION: Renders a magenta line between points (339, 184) and (7, 250).
; PLAN: r0=339(x1), r1=184(y1), r2=7(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 184
LDI r2, 7
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
