; DESCRIPTION: Places a blue circle of radius 24 at center (172, 188).
; PLAN: r0=172(x), r1=188(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 188
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
