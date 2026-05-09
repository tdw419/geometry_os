; DESCRIPTION: Places a red line segment connecting (309, 143) to (292, 246).
; PLAN: r0=309(x1), r1=143(y1), r2=292(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 143
LDI r2, 292
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
