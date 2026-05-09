; DESCRIPTION: Renders a black disk with center (281, 92) and radius 68.
; PLAN: r0=281(x), r1=92(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 92
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
