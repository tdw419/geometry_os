; DESCRIPTION: Places a yellow circle of radius 61 at center (447, 112).
; PLAN: r0=447(x), r1=112(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 112
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
