; DESCRIPTION: Composite: Draws a white circle centered at (437, 91) with radius 55 then Places a white dot at position (35, 140).
; PLAN: r0=437(x), r1=91(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=140(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 91
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 140
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
