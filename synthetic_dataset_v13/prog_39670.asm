; DESCRIPTION: Draws a red line from (265, 32) to (137, 95).
; PLAN: r0=265(x1), r1=32(y1), r2=137(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 32
LDI r2, 137
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
