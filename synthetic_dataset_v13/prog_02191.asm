; DESCRIPTION: Draws a purple circle centered at (333, 42) with radius 25.
; PLAN: r0=333(x), r1=42(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 42
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
