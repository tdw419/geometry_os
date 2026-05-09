; DESCRIPTION: Composite: Creates a blue circular shape at (218, 42) with radius 39 then Places a purple dot at position (135, 199).
; PLAN: r0=218(x), r1=42(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=199(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 42
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 199
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
