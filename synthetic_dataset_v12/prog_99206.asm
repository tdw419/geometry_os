; DESCRIPTION: Places a blue circle of radius 57 at center (381, 166).
; PLAN: r0=381(x), r1=166(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 166
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
