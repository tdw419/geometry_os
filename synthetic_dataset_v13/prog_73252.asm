; DESCRIPTION: Composite: Draws a cyan circle centered at (207, 121) with radius 55 then Places a blue dot at position (151, 241).
; PLAN: r0=207(x), r1=121(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=241(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 121
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 241
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
