; DESCRIPTION: Renders a red disk with center (239, 158) and radius 61.
; PLAN: r0=239(x), r1=158(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 158
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
