; DESCRIPTION: Composite: Draws a orange circle centered at (114, 85) with radius 77 then Places a white dot at position (394, 146).
; PLAN: r0=114(x), r1=85(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=146(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 114
LDI r1, 85
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 146
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
