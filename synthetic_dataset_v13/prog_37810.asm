; DESCRIPTION: Places a cyan circle of radius 14 at center (497, 72).
; PLAN: r0=497(x), r1=72(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 497
LDI r1, 72
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
