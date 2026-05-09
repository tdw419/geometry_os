; DESCRIPTION: Draws a black circle centered at (248, 154) with radius 60.
; PLAN: r0=248(x), r1=154(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 154
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
