; DESCRIPTION: Places a blue circle of radius 43 at center (66, 52).
; PLAN: r0=66(x), r1=52(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 52
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
