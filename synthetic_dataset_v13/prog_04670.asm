; DESCRIPTION: Draws a blue circle centered at (355, 173) with radius 61.
; PLAN: r0=355(x), r1=173(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 173
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
