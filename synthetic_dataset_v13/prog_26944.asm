; DESCRIPTION: Renders a black disk with center (42, 154) and radius 34.
; PLAN: r0=42(x), r1=154(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 154
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
