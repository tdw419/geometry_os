; DESCRIPTION: Draws a blue circle centered at (213, 196) with radius 47.
; PLAN: r0=213(x), r1=196(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 196
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
