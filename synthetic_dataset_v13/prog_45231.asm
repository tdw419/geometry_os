; DESCRIPTION: Places a blue circle of radius 21 at center (469, 27).
; PLAN: r0=469(x), r1=27(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 27
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
