; DESCRIPTION: Draws a blue circle centered at (338, 36) with radius 27.
; PLAN: r0=338(x), r1=36(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 36
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
