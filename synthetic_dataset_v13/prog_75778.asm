; DESCRIPTION: Places a orange circle of radius 71 at center (418, 177).
; PLAN: r0=418(x), r1=177(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 177
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
