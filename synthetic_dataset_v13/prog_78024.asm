; DESCRIPTION: Draws a red line from (62, 77) to (267, 95).
; PLAN: r0=62(x1), r1=77(y1), r2=267(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 77
LDI r2, 267
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
