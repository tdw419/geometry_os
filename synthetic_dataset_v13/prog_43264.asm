; DESCRIPTION: Draws a purple circle centered at (172, 173) with radius 52.
; PLAN: r0=172(x), r1=173(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 173
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
