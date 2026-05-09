; DESCRIPTION: Renders a cyan disk with center (409, 92) and radius 76.
; PLAN: r0=409(x), r1=92(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 92
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
