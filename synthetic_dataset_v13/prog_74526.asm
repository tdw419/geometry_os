; DESCRIPTION: Draws a black circle centered at (54, 205) with radius 13.
; PLAN: r0=54(x), r1=205(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 205
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
