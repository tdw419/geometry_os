; DESCRIPTION: Draws a yellow circle centered at (87, 108) with radius 76.
; PLAN: r0=87(x), r1=108(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 108
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
