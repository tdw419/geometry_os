; DESCRIPTION: Renders a red line between points (408, 221) and (252, 104).
; PLAN: r0=408(x1), r1=221(y1), r2=252(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 221
LDI r2, 252
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
