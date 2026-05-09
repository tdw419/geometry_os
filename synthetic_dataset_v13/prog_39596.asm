; DESCRIPTION: Renders a yellow line between points (57, 89) and (86, 85).
; PLAN: r0=57(x1), r1=89(y1), r2=86(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 89
LDI r2, 86
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
