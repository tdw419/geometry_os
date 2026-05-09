; DESCRIPTION: Composite: Draws a red circle centered at (348, 126) with radius 39 then Places a green dot at position (454, 0).
; PLAN: r0=348(x), r1=126(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=0(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 126
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 0
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
