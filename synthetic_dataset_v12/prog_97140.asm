; DESCRIPTION: Renders a red line between points (76, 49) and (301, 197).
; PLAN: r0=76(x1), r1=49(y1), r2=301(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 49
LDI r2, 301
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
