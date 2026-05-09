; DESCRIPTION: Places a blue circle of radius 32 at center (71, 198).
; PLAN: r0=71(x), r1=198(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 198
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
