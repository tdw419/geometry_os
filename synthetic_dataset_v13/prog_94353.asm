; DESCRIPTION: Renders a black line between points (76, 163) and (53, 188).
; PLAN: r0=76(x1), r1=163(y1), r2=53(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 163
LDI r2, 53
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
