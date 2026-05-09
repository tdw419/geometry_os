; DESCRIPTION: Composite: Sets a single magenta pixel at (511, 161) then Places a purple circle of radius 43 at center (324, 111).
; PLAN: r0=511(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=111(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 111
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
