; DESCRIPTION: Renders a green line between points (348, 173) and (511, 122).
; PLAN: r0=348(x1), r1=173(y1), r2=511(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 173
LDI r2, 511
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
