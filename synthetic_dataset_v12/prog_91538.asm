; DESCRIPTION: Draws a purple circle centered at (168, 146) with radius 64.
; PLAN: r0=168(x), r1=146(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 146
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
