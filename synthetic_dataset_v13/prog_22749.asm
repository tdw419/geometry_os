; DESCRIPTION: Renders a green line between points (377, 224) and (141, 157).
; PLAN: r0=377(x1), r1=224(y1), r2=141(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 224
LDI r2, 141
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
