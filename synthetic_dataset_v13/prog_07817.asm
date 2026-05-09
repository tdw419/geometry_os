; DESCRIPTION: Renders a red line between points (76, 52) and (122, 104).
; PLAN: r0=76(x1), r1=52(y1), r2=122(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 52
LDI r2, 122
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
