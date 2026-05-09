; DESCRIPTION: Renders a white line between points (348, 46) and (297, 209).
; PLAN: r0=348(x1), r1=46(y1), r2=297(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 46
LDI r2, 297
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
