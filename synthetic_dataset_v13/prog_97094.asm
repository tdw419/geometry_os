; DESCRIPTION: Renders a red line between points (463, 155) and (215, 149).
; PLAN: r0=463(x1), r1=155(y1), r2=215(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 155
LDI r2, 215
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
