; DESCRIPTION: Renders a green line between points (296, 100) and (308, 205).
; PLAN: r0=296(x1), r1=100(y1), r2=308(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 100
LDI r2, 308
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
