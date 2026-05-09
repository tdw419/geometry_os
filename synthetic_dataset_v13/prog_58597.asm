; DESCRIPTION: Renders a yellow line between points (474, 76) and (311, 161).
; PLAN: r0=474(x1), r1=76(y1), r2=311(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 76
LDI r2, 311
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
