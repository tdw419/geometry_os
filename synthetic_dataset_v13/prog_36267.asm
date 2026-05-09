; DESCRIPTION: Draws a blue circle centered at (81, 173) with radius 25.
; PLAN: r0=81(x), r1=173(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 173
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
