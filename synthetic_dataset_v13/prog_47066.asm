; DESCRIPTION: Renders a red disk with center (211, 113) and radius 61.
; PLAN: r0=211(x), r1=113(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 113
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
