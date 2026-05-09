; DESCRIPTION: Draws a blue circle centered at (197, 191) with radius 64.
; PLAN: r0=197(x), r1=191(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 191
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
