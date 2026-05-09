; DESCRIPTION: Renders a yellow disk with center (348, 202) and radius 38.
; PLAN: r0=348(x), r1=202(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 202
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
