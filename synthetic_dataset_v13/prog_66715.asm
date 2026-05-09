; DESCRIPTION: Places a blue circle of radius 77 at center (354, 100).
; PLAN: r0=354(x), r1=100(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 100
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
