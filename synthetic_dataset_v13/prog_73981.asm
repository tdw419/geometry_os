; DESCRIPTION: Composite: Places a cyan dot at position (129, 94) then Draws a orange circle centered at (79, 147) with radius 28.
; PLAN: r0=129(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=147(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 147
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
