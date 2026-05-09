; DESCRIPTION: Renders a green line between points (209, 172) and (348, 94).
; PLAN: r0=209(x1), r1=172(y1), r2=348(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 172
LDI r2, 348
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
