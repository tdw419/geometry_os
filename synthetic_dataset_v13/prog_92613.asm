; DESCRIPTION: Composite: Creates a green circular shape at (293, 224) with radius 27 then Places a cyan dot at position (278, 88).
; PLAN: r0=293(x), r1=224(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 224
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
