; DESCRIPTION: Renders a green line between points (158, 76) and (53, 165).
; PLAN: r0=158(x1), r1=76(y1), r2=53(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 76
LDI r2, 53
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
