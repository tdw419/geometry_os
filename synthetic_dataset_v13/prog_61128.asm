; DESCRIPTION: Draws a red line from (115, 134) to (287, 62).
; PLAN: r0=115(x1), r1=134(y1), r2=287(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 134
LDI r2, 287
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
