; DESCRIPTION: Renders a black disk with center (86, 53) and radius 42.
; PLAN: r0=86(x), r1=53(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 53
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
