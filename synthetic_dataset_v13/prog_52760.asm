; DESCRIPTION: Draws a yellow circle centered at (101, 108) with radius 42.
; PLAN: r0=101(x), r1=108(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 108
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
