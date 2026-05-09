; DESCRIPTION: Places a blue circle of radius 43 at center (50, 122).
; PLAN: r0=50(x), r1=122(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 122
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
