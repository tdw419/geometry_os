; DESCRIPTION: Places a blue circle of radius 53 at center (450, 193).
; PLAN: r0=450(x), r1=193(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 193
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
