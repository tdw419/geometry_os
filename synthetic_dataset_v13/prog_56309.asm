; DESCRIPTION: Renders a red line between points (204, 102) and (459, 95).
; PLAN: r0=204(x1), r1=102(y1), r2=459(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 102
LDI r2, 459
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
