; DESCRIPTION: Places a green circle of radius 41 at center (447, 56).
; PLAN: r0=447(x), r1=56(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 56
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
