; DESCRIPTION: Renders a green line between points (266, 119) and (244, 245).
; PLAN: r0=266(x1), r1=119(y1), r2=244(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 119
LDI r2, 244
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
