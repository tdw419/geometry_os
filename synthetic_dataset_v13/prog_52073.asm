; DESCRIPTION: Places a white circle of radius 62 at center (418, 190).
; PLAN: r0=418(x), r1=190(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 190
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
