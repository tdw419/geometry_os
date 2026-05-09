; DESCRIPTION: Places a cyan circle of radius 61 at center (418, 183).
; PLAN: r0=418(x), r1=183(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 183
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
