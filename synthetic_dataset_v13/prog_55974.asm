; DESCRIPTION: Draws a blue circle centered at (126, 86) with radius 67.
; PLAN: r0=126(x), r1=86(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 86
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
