; DESCRIPTION: Places a yellow circle of radius 11 at center (346, 102).
; PLAN: r0=346(x), r1=102(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 102
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
