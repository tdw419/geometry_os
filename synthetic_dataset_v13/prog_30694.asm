; DESCRIPTION: Draws a purple circle centered at (333, 167) with radius 42.
; PLAN: r0=333(x), r1=167(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 167
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
