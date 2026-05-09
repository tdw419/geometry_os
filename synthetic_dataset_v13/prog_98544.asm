; DESCRIPTION: Places a blue circle of radius 16 at center (376, 166).
; PLAN: r0=376(x), r1=166(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 166
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
