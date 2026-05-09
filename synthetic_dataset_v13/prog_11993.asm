; DESCRIPTION: Renders a black disk with center (202, 90) and radius 74.
; PLAN: r0=202(x), r1=90(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 90
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
