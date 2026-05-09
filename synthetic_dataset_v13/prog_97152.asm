; DESCRIPTION: Renders a yellow line between points (219, 130) and (348, 158).
; PLAN: r0=219(x1), r1=130(y1), r2=348(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 130
LDI r2, 348
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
