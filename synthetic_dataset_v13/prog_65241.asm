; DESCRIPTION: Composite: Draws a orange circle centered at (111, 152) with radius 73 then Places a black dot at position (45, 84).
; PLAN: r0=111(x), r1=152(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 152
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
HALT
