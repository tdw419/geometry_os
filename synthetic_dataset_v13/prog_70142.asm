; DESCRIPTION: Composite: Draws a cyan circle centered at (33, 220) with radius 12 then Places a white dot at position (83, 180).
; PLAN: r0=33(x), r1=220(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=180(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 220
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 180
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
