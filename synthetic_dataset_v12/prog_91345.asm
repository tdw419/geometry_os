; DESCRIPTION: Places a blue circle of radius 29 at center (294, 104).
; PLAN: r0=294(x), r1=104(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 104
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
