; DESCRIPTION: Places a purple circle of radius 32 at center (241, 92).
; PLAN: r0=241(x), r1=92(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 92
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
