; DESCRIPTION: Renders a black disk with center (268, 120) and radius 42.
; PLAN: r0=268(x), r1=120(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 120
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
