; DESCRIPTION: Composite: Draws a white circle centered at (343, 153) with radius 65 then Places a red dot at position (40, 225).
; PLAN: r0=343(x), r1=153(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=225(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 153
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 225
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
