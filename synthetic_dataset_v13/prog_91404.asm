; DESCRIPTION: Renders a green line between points (76, 238) and (55, 176).
; PLAN: r0=76(x1), r1=238(y1), r2=55(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 238
LDI r2, 55
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
