; DESCRIPTION: Composite: Draws a white circle centered at (118, 108) with radius 78 then Sets a single cyan pixel at (30, 109).
; PLAN: r0=118(x), r1=108(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=109(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 108
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 109
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
