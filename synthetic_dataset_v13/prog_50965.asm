; DESCRIPTION: Places a yellow circle of radius 19 at center (304, 221).
; PLAN: r0=304(x), r1=221(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 221
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
