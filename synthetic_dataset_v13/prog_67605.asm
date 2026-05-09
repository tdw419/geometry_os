; DESCRIPTION: Composite: Draws a orange circle centered at (234, 128) with radius 33 then Places a cyan dot at position (415, 241).
; PLAN: r0=234(x), r1=128(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=241(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 128
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 241
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
