; DESCRIPTION: Places a white circle of radius 32 at center (414, 161).
; PLAN: r0=414(x), r1=161(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 161
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
