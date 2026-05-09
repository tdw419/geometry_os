; DESCRIPTION: Renders a red line between points (411, 104) and (217, 76).
; PLAN: r0=411(x1), r1=104(y1), r2=217(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 104
LDI r2, 217
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
