; DESCRIPTION: Renders a yellow line between points (435, 89) and (292, 39).
; PLAN: r0=435(x1), r1=89(y1), r2=292(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 89
LDI r2, 292
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
