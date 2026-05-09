; DESCRIPTION: Places a blue circle of radius 12 at center (320, 104).
; PLAN: r0=320(x), r1=104(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 104
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
