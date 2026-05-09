; DESCRIPTION: Renders a white disk with center (418, 131) and radius 32.
; PLAN: r0=418(x), r1=131(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 131
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
