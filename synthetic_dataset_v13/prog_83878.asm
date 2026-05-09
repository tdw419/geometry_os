; DESCRIPTION: Places a yellow circle of radius 43 at center (447, 75).
; PLAN: r0=447(x), r1=75(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 75
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
