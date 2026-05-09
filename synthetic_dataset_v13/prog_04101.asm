; DESCRIPTION: Composite: Draws a yellow circle centered at (241, 100) with radius 16 then Places a orange dot at position (96, 83).
; PLAN: r0=241(x), r1=100(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 100
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
