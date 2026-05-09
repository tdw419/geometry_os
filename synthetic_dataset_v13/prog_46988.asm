; DESCRIPTION: Composite: Sets a single orange pixel at (310, 221) then Draws a purple circle centered at (122, 223) with radius 15.
; PLAN: r0=310(x), r1=221(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=223(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 221
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 122
LDI r6, 223
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
