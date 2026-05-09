; DESCRIPTION: Places a blue circle of radius 39 at center (68, 43).
; PLAN: r0=68(x), r1=43(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 43
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
