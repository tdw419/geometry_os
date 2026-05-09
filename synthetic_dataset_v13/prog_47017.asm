; DESCRIPTION: Renders a red disk with center (379, 64) and radius 47.
; PLAN: r0=379(x), r1=64(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 64
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
