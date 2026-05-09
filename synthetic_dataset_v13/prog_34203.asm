; DESCRIPTION: Composite: Draws a orange circle centered at (300, 160) with radius 77 then Places a white dot at position (411, 12).
; PLAN: r0=300(x), r1=160(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=12(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 160
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 12
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
