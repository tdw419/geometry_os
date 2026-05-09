; DESCRIPTION: Composite: Draws a white circle centered at (349, 149) with radius 44 then Places a orange dot at position (187, 27).
; PLAN: r0=349(x), r1=149(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=27(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 149
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 27
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
