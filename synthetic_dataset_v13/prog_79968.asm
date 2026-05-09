; DESCRIPTION: Draws a yellow circle centered at (32, 204) with radius 27.
; PLAN: r0=32(x), r1=204(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 204
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
