; DESCRIPTION: Composite: Creates a green circular shape at (67, 51) with radius 40 then Places a cyan dot at position (48, 211).
; PLAN: r0=67(x), r1=51(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=211(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 67
LDI r1, 51
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 211
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
