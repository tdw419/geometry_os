; DESCRIPTION: Renders a red line between points (43, 104) and (310, 96).
; PLAN: r0=43(x1), r1=104(y1), r2=310(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 104
LDI r2, 310
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
