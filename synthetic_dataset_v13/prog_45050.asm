; DESCRIPTION: Composite: Places a yellow dot at position (74, 105) then Draws a orange circle centered at (438, 92) with radius 64.
; PLAN: r0=74(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=92(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 105
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 438
LDI r6, 92
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
