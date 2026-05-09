; DESCRIPTION: Renders a yellow line between points (238, 61) and (483, 84).
; PLAN: r0=238(x1), r1=61(y1), r2=483(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 61
LDI r2, 483
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
