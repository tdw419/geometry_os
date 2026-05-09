; DESCRIPTION: Draws a red line from (157, 21) to (292, 248).
; PLAN: r0=157(x1), r1=21(y1), r2=292(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 21
LDI r2, 292
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
