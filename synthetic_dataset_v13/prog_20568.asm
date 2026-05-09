; DESCRIPTION: Composite: Creates a cyan circular shape at (300, 100) with radius 16 then Places a white dot at position (261, 155).
; PLAN: r0=300(x), r1=100(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=155(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 100
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 155
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
