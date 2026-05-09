; DESCRIPTION: Draws a blue circle centered at (384, 167) with radius 74.
; PLAN: r0=384(x), r1=167(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 167
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
