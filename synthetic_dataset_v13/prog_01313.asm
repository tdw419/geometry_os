; DESCRIPTION: Draws a yellow line from (443, 252) to (93, 62).
; PLAN: r0=443(x1), r1=252(y1), r2=93(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 252
LDI r2, 93
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
