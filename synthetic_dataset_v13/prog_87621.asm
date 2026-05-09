; DESCRIPTION: Composite: Draws a orange circle centered at (57, 72) with radius 40 then Places a cyan dot at position (439, 57).
; PLAN: r0=57(x), r1=72(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=57(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 72
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 57
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
