; DESCRIPTION: Renders a red line between points (38, 230) and (216, 159).
; PLAN: r0=38(x1), r1=230(y1), r2=216(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 230
LDI r2, 216
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
