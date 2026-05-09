; DESCRIPTION: Draws a yellow circle centered at (205, 128) with radius 55.
; PLAN: r0=205(x), r1=128(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 128
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
