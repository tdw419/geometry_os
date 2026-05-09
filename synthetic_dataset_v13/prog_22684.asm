; DESCRIPTION: Renders a green line between points (98, 90) and (282, 158).
; PLAN: r0=98(x1), r1=90(y1), r2=282(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 90
LDI r2, 282
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
