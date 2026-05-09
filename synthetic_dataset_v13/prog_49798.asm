; DESCRIPTION: Renders a yellow line between points (64, 38) and (396, 85).
; PLAN: r0=64(x1), r1=38(y1), r2=396(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 38
LDI r2, 396
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
