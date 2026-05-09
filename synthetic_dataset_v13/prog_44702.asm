; DESCRIPTION: Renders a green line between points (81, 184) and (337, 159).
; PLAN: r0=81(x1), r1=184(y1), r2=337(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 184
LDI r2, 337
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
