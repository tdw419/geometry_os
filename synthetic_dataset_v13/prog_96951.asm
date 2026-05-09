; DESCRIPTION: Composite: Places a black dot at position (296, 174) then Creates a orange circular shape at (107, 153) with radius 79.
; PLAN: r0=296(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=153(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 107
LDI r6, 153
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
