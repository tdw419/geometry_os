; DESCRIPTION: Composite: Draws a purple circle centered at (285, 154) with radius 17 then Places a cyan dot at position (413, 195).
; PLAN: r0=285(x), r1=154(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 154
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
