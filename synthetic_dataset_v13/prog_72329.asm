; DESCRIPTION: Renders a cyan disk with center (421, 142) and radius 71.
; PLAN: r0=421(x), r1=142(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 142
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
