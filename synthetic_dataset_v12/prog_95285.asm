; DESCRIPTION: Composite: Places a green circle of radius 16 at center (178, 195) then Places a white dot at position (447, 72).
; PLAN: r0=178(x), r1=195(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=72(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 195
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 72
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
