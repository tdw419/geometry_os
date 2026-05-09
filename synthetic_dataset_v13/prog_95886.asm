; DESCRIPTION: Renders a green line between points (220, 246) and (200, 238).
; PLAN: r0=220(x1), r1=246(y1), r2=200(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 246
LDI r2, 200
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
