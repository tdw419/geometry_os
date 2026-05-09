; DESCRIPTION: Draws a red line from (75, 246) to (500, 42).
; PLAN: r0=75(x1), r1=246(y1), r2=500(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 246
LDI r2, 500
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
