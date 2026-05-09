; DESCRIPTION: Renders a green disk with center (182, 92) and radius 76.
; PLAN: r0=182(x), r1=92(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 92
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
