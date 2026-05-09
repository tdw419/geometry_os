; DESCRIPTION: Places a cyan circle of radius 78 at center (310, 92).
; PLAN: r0=310(x), r1=92(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 92
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
