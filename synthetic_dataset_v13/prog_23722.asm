; DESCRIPTION: Creates a yellow circular shape at (236, 166) with radius 31.
; PLAN: r0=236(x), r1=166(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 166
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
