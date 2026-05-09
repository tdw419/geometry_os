; DESCRIPTION: Renders a red line between points (332, 113) and (10, 0).
; PLAN: r0=332(x1), r1=113(y1), r2=10(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 113
LDI r2, 10
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
