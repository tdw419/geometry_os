; DESCRIPTION: Renders a magenta line between points (484, 243) and (339, 80).
; PLAN: r0=484(x1), r1=243(y1), r2=339(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 243
LDI r2, 339
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
