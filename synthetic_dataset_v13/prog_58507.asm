; DESCRIPTION: Composite: Creates a white circular shape at (421, 100) with radius 63 then Places a green dot at position (472, 132).
; PLAN: r0=421(x), r1=100(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 100
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
