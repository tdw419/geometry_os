; DESCRIPTION: Draws a purple circle centered at (396, 228) with radius 25.
; PLAN: r0=396(x), r1=228(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 228
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
