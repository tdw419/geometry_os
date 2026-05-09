; DESCRIPTION: Composite: Draws a purple circle centered at (403, 87) with radius 41 then Sets a single green pixel at (233, 27).
; PLAN: r0=403(x), r1=87(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=27(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 87
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 27
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
