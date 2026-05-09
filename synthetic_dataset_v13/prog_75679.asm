; DESCRIPTION: Composite: Creates a blue circular shape at (405, 111) with radius 53 then Places a orange dot at position (374, 83).
; PLAN: r0=405(x), r1=111(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 111
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
