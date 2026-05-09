; DESCRIPTION: Composite: Draws a black circle centered at (322, 174) with radius 73 then Places a red dot at position (35, 224).
; PLAN: r0=322(x), r1=174(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=224(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 174
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 224
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
