; DESCRIPTION: Renders a green line between points (133, 115) and (119, 71).
; PLAN: r0=133(x1), r1=115(y1), r2=119(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 115
LDI r2, 119
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
