; DESCRIPTION: Places a white circle of radius 71 at center (324, 155).
; PLAN: r0=324(x), r1=155(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 155
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
