; DESCRIPTION: Renders a red line between points (348, 160) and (365, 57).
; PLAN: r0=348(x1), r1=160(y1), r2=365(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 160
LDI r2, 365
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
