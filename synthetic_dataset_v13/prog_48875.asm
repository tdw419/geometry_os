; DESCRIPTION: Renders a black disk with center (220, 77) and radius 52.
; PLAN: r0=220(x), r1=77(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 77
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
