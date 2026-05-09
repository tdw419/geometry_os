; DESCRIPTION: Composite: Places a purple dot at position (172, 230) then Draws a orange circle centered at (380, 98) with radius 48.
; PLAN: r0=172(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=98(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 98
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
