; DESCRIPTION: Draws a orange line from (206, 246) to (269, 95).
; PLAN: r0=206(x1), r1=246(y1), r2=269(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 246
LDI r2, 269
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
