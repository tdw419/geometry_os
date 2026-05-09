; DESCRIPTION: Composite: Creates a green circular shape at (270, 29) with radius 15 then Sets a single white pixel at (480, 204).
; PLAN: r0=270(x), r1=29(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x), r6=204(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 29
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 204
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
