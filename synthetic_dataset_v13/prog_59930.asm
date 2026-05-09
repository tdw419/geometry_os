; DESCRIPTION: Places a cyan circle of radius 56 at center (92, 78).
; PLAN: r0=92(x), r1=78(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 78
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
