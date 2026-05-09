; DESCRIPTION: Renders a green line between points (478, 68) and (52, 238).
; PLAN: r0=478(x1), r1=68(y1), r2=52(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 68
LDI r2, 52
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
