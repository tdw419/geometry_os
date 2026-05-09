; DESCRIPTION: Composite: Creates a cyan circular shape at (143, 165) with radius 67 then Places a purple dot at position (314, 121).
; PLAN: r0=143(x), r1=165(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=121(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 165
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 121
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
