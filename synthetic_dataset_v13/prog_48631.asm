; DESCRIPTION: Renders a black disk with center (80, 173) and radius 35.
; PLAN: r0=80(x), r1=173(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 173
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
