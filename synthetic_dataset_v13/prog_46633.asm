; DESCRIPTION: Composite: Creates a white circular shape at (298, 106) with radius 71 then Places a yellow dot at position (64, 13).
; PLAN: r0=298(x), r1=106(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=13(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 106
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 13
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
