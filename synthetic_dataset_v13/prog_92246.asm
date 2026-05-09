; DESCRIPTION: Renders a yellow line between points (140, 94) and (38, 158).
; PLAN: r0=140(x1), r1=94(y1), r2=38(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 94
LDI r2, 38
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
