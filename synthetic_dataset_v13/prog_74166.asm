; DESCRIPTION: Renders a red line between points (348, 121) and (483, 173).
; PLAN: r0=348(x1), r1=121(y1), r2=483(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 121
LDI r2, 483
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
