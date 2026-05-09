; DESCRIPTION: Draws a blue circle centered at (164, 191) with radius 42.
; PLAN: r0=164(x), r1=191(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 191
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
