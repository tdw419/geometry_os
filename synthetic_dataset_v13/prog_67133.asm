; DESCRIPTION: Composite: Places a cyan dot at position (102, 248) then Draws a orange circle centered at (478, 198) with radius 18.
; PLAN: r0=102(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=198(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 198
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
