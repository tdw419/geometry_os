; DESCRIPTION: Creates a yellow circular shape at (106, 166) with radius 47.
; PLAN: r0=106(x), r1=166(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 166
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
