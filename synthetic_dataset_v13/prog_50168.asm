; DESCRIPTION: Renders a green line between points (430, 55) and (388, 238).
; PLAN: r0=430(x1), r1=55(y1), r2=388(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 55
LDI r2, 388
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
