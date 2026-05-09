; DESCRIPTION: Places a purple circle of radius 63 at center (66, 184).
; PLAN: r0=66(x), r1=184(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 184
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
