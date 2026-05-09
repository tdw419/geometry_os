; DESCRIPTION: Draws a purple circle centered at (59, 46) with radius 39.
; PLAN: r0=59(x), r1=46(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 46
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
