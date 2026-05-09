; DESCRIPTION: Composite: Creates a white circular shape at (111, 123) with radius 67 then Places a orange dot at position (345, 25).
; PLAN: r0=111(x), r1=123(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 123
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
