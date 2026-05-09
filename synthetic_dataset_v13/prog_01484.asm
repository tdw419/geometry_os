; DESCRIPTION: Renders a green line between points (189, 72) and (163, 41).
; PLAN: r0=189(x1), r1=72(y1), r2=163(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 72
LDI r2, 163
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
