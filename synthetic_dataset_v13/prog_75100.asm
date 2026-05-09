; DESCRIPTION: Creates a orange circular shape at (148, 166) with radius 24.
; PLAN: r0=148(x), r1=166(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 166
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
