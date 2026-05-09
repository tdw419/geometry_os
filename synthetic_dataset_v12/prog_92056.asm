; DESCRIPTION: Renders a red disk with center (312, 82) and radius 30.
; PLAN: r0=312(x), r1=82(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 82
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
