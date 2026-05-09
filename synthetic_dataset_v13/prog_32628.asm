; DESCRIPTION: Places a blue circle of radius 12 at center (270, 193).
; PLAN: r0=270(x), r1=193(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 193
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
