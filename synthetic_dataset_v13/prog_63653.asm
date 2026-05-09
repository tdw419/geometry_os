; DESCRIPTION: Draws a blue circle centered at (191, 135) with radius 27.
; PLAN: r0=191(x), r1=135(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 135
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
