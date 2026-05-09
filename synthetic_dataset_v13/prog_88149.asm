; DESCRIPTION: Renders a magenta line between points (1, 149) and (484, 96).
; PLAN: r0=1(x1), r1=149(y1), r2=484(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 149
LDI r2, 484
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
