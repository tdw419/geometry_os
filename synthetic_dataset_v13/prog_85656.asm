; DESCRIPTION: Renders a red disk with center (53, 56) and radius 21.
; PLAN: r0=53(x), r1=56(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 56
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
