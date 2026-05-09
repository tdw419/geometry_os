; DESCRIPTION: Places a blue circle of radius 15 at center (258, 214).
; PLAN: r0=258(x), r1=214(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 214
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
