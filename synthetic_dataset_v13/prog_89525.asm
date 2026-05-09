; DESCRIPTION: Draws a purple circle centered at (405, 117) with radius 55.
; PLAN: r0=405(x), r1=117(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 117
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
