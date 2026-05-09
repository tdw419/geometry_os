; DESCRIPTION: Draws a red line from (98, 116) to (184, 136).
; PLAN: r0=98(x1), r1=116(y1), r2=184(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 116
LDI r2, 184
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
