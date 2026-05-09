; DESCRIPTION: Places a blue circle of radius 29 at center (353, 57).
; PLAN: r0=353(x), r1=57(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 57
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
