; DESCRIPTION: Renders a blue disk with center (418, 41) and radius 32.
; PLAN: r0=418(x), r1=41(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 41
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
