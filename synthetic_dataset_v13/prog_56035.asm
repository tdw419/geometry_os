; DESCRIPTION: Renders a black disk with center (116, 131) and radius 59.
; PLAN: r0=116(x), r1=131(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 131
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
