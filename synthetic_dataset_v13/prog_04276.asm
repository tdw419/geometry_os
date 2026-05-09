; DESCRIPTION: Places a blue circle of radius 18 at center (425, 172).
; PLAN: r0=425(x), r1=172(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 172
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
