; DESCRIPTION: Renders a black disk with center (151, 168) and radius 61.
; PLAN: r0=151(x), r1=168(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 168
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
