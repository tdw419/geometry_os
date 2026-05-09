; DESCRIPTION: Places a blue circle of radius 46 at center (230, 84).
; PLAN: r0=230(x), r1=84(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 84
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
