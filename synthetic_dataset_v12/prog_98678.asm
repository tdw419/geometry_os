; DESCRIPTION: Renders a red line between points (157, 176) and (358, 157).
; PLAN: r0=157(x1), r1=176(y1), r2=358(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 176
LDI r2, 358
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
