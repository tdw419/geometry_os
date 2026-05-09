; DESCRIPTION: Renders a black disk with center (298, 14) and radius 14.
; PLAN: r0=298(x), r1=14(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 14
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
