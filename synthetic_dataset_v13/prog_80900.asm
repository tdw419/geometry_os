; DESCRIPTION: Draws a blue circle centered at (90, 111) with radius 25.
; PLAN: r0=90(x), r1=111(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 111
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
