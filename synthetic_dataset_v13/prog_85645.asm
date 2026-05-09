; DESCRIPTION: Renders a yellow disk with center (418, 115) and radius 64.
; PLAN: r0=418(x), r1=115(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 115
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
