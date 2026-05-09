; DESCRIPTION: Creates a yellow circular shape at (383, 111) with radius 63.
; PLAN: r0=383(x), r1=111(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 111
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
