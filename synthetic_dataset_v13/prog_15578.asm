; DESCRIPTION: Draws a blue circle centered at (195, 146) with radius 62.
; PLAN: r0=195(x), r1=146(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 146
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
