; DESCRIPTION: Draws a red line from (156, 24) to (186, 93).
; PLAN: r0=156(x1), r1=24(y1), r2=186(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 24
LDI r2, 186
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
