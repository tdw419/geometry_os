; DESCRIPTION: Renders a white disk with center (394, 82) and radius 29.
; PLAN: r0=394(x), r1=82(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 82
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
