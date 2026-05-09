; DESCRIPTION: Renders a green line between points (252, 227) and (109, 133).
; PLAN: r0=252(x1), r1=227(y1), r2=109(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 227
LDI r2, 109
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
