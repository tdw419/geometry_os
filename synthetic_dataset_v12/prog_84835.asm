; DESCRIPTION: Draws a yellow circle centered at (86, 42) with radius 14.
; PLAN: r0=86(x), r1=42(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 42
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
