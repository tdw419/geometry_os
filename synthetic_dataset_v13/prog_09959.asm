; DESCRIPTION: Draws a blue circle centered at (173, 147) with radius 56.
; PLAN: r0=173(x), r1=147(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 147
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
