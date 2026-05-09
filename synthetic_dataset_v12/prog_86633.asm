; DESCRIPTION: Draws a black circle centered at (468, 129) with radius 42.
; PLAN: r0=468(x), r1=129(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 129
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
