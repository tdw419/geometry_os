; DESCRIPTION: Places a blue circle of radius 53 at center (63, 92).
; PLAN: r0=63(x), r1=92(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 92
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
