; DESCRIPTION: Renders a red line between points (348, 104) and (279, 174).
; PLAN: r0=348(x1), r1=104(y1), r2=279(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 104
LDI r2, 279
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
