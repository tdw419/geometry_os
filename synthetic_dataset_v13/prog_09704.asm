; DESCRIPTION: Renders a green line between points (308, 90) and (133, 230).
; PLAN: r0=308(x1), r1=90(y1), r2=133(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 90
LDI r2, 133
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
