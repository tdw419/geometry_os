; DESCRIPTION: Renders a green line between points (505, 171) and (287, 245).
; PLAN: r0=505(x1), r1=171(y1), r2=287(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 171
LDI r2, 287
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
