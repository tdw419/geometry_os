; DESCRIPTION: Renders a red line between points (99, 24) and (326, 85).
; PLAN: r0=99(x1), r1=24(y1), r2=326(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 24
LDI r2, 326
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
