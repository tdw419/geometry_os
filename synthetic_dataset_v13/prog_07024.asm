; DESCRIPTION: Draws a yellow circle centered at (89, 60) with radius 42.
; PLAN: r0=89(x), r1=60(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 60
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
