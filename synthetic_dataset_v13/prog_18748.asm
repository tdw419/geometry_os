; DESCRIPTION: Draws a black circle centered at (154, 99) with radius 60.
; PLAN: r0=154(x), r1=99(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 99
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
