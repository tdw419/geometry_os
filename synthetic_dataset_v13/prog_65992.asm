; DESCRIPTION: Renders a red line between points (338, 168) and (276, 60).
; PLAN: r0=338(x1), r1=168(y1), r2=276(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 168
LDI r2, 276
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
