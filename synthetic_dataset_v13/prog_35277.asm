; DESCRIPTION: Renders a green line between points (435, 0) and (396, 194).
; PLAN: r0=435(x1), r1=0(y1), r2=396(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 0
LDI r2, 396
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
