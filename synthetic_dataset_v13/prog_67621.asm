; DESCRIPTION: Draws a yellow circle centered at (405, 83) with radius 55.
; PLAN: r0=405(x), r1=83(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 83
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
