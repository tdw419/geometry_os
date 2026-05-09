; DESCRIPTION: Renders a green line between points (185, 238) and (292, 142).
; PLAN: r0=185(x1), r1=238(y1), r2=292(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 238
LDI r2, 292
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
