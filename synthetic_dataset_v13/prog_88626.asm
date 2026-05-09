; DESCRIPTION: Draws a yellow circle centered at (45, 49) with radius 42.
; PLAN: r0=45(x), r1=49(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 49
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
