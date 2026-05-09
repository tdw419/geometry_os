; DESCRIPTION: Renders a green line between points (188, 109) and (287, 244).
; PLAN: r0=188(x1), r1=109(y1), r2=287(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 109
LDI r2, 287
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
