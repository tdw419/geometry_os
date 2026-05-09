; DESCRIPTION: Renders a red disk with center (199, 62) and radius 42.
; PLAN: r0=199(x), r1=62(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 62
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
