; DESCRIPTION: Renders a red line between points (381, 187) and (61, 157).
; PLAN: r0=381(x1), r1=187(y1), r2=61(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 187
LDI r2, 61
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
