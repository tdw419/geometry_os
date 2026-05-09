; DESCRIPTION: Composite: Sets a single black pixel at (473, 139) then Draws a red circle centered at (126, 95) with radius 28.
; PLAN: r0=473(x), r1=139(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=95(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 139
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 126
LDI r6, 95
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
