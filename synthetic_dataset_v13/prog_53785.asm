; DESCRIPTION: Renders a cyan line between points (335, 146) and (348, 183).
; PLAN: r0=335(x1), r1=146(y1), r2=348(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 146
LDI r2, 348
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
