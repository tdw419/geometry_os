; DESCRIPTION: Creates a yellow circular shape at (319, 135) with radius 24.
; PLAN: r0=319(x), r1=135(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 135
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
