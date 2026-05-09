; DESCRIPTION: Places a blue circle of radius 28 at center (232, 192).
; PLAN: r0=232(x), r1=192(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 192
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
