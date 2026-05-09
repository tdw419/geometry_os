; DESCRIPTION: Renders a red line between points (358, 100) and (117, 3).
; PLAN: r0=358(x1), r1=100(y1), r2=117(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 100
LDI r2, 117
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
