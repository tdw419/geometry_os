; DESCRIPTION: Composite: Draws a cyan circle centered at (83, 139) with radius 78 then Places a red dot at position (38, 192).
; PLAN: r0=83(x), r1=139(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 139
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
