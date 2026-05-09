; DESCRIPTION: Places a purple circle of radius 29 at center (372, 83).
; PLAN: r0=372(x), r1=83(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 83
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
