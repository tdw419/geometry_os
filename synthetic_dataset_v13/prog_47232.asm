; DESCRIPTION: Renders a green line between points (411, 11) and (348, 26).
; PLAN: r0=411(x1), r1=11(y1), r2=348(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 11
LDI r2, 348
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
