; DESCRIPTION: Composite: Sets a single blue pixel at (456, 46) then Draws a orange circle centered at (394, 160) with radius 76.
; PLAN: r0=456(x), r1=46(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=160(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 456
LDI r1, 46
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 160
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
