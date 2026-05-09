; DESCRIPTION: Places a blue circle of radius 39 at center (456, 147).
; PLAN: r0=456(x), r1=147(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 147
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
