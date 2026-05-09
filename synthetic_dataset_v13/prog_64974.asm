; DESCRIPTION: Draws a red line from (236, 212) to (184, 138).
; PLAN: r0=236(x1), r1=212(y1), r2=184(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 212
LDI r2, 184
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
