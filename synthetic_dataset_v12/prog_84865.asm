; DESCRIPTION: Renders a yellow line between points (139, 188) and (336, 134).
; PLAN: r0=139(x1), r1=188(y1), r2=336(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 188
LDI r2, 336
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
