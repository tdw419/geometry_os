; DESCRIPTION: Draws a red line from (184, 207) to (29, 129).
; PLAN: r0=184(x1), r1=207(y1), r2=29(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 207
LDI r2, 29
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
