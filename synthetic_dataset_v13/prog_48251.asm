; DESCRIPTION: Draws a black circle centered at (68, 243) with radius 13.
; PLAN: r0=68(x), r1=243(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 243
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
