; DESCRIPTION: Renders a yellow line between points (309, 184) and (375, 153).
; PLAN: r0=309(x1), r1=184(y1), r2=375(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 184
LDI r2, 375
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
