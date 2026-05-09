; DESCRIPTION: Renders a yellow disk with center (251, 164) and radius 74.
; PLAN: r0=251(x), r1=164(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 164
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
