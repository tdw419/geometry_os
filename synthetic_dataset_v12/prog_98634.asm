; DESCRIPTION: Places a blue circle of radius 47 at center (354, 178).
; PLAN: r0=354(x), r1=178(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 178
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
