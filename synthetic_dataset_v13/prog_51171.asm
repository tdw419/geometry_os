; DESCRIPTION: Draws a black circle centered at (394, 98) with radius 36.
; PLAN: r0=394(x), r1=98(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 98
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
