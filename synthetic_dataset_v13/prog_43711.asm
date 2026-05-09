; DESCRIPTION: Renders a green line between points (157, 246) and (120, 35).
; PLAN: r0=157(x1), r1=246(y1), r2=120(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 246
LDI r2, 120
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
