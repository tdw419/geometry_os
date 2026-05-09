; DESCRIPTION: Places a blue circle of radius 48 at center (375, 65).
; PLAN: r0=375(x), r1=65(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 65
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
