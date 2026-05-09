; DESCRIPTION: Places a cyan circle of radius 18 at center (418, 115).
; PLAN: r0=418(x), r1=115(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 115
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
