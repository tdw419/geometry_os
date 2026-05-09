; DESCRIPTION: Draws a purple circle centered at (426, 42) with radius 29.
; PLAN: r0=426(x), r1=42(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 42
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
