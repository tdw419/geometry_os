; DESCRIPTION: Places a black circle of radius 77 at center (261, 84).
; PLAN: r0=261(x), r1=84(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 84
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
