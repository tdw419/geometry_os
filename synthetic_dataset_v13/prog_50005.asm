; DESCRIPTION: Places a yellow circle of radius 58 at center (304, 102).
; PLAN: r0=304(x), r1=102(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 102
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
