; DESCRIPTION: Composite: Draws a red circle centered at (352, 106) with radius 74 then Sets a single black pixel at (446, 255).
; PLAN: r0=352(x), r1=106(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=255(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 106
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 255
LDI r7, 0x000000
PSET r5, r6, r7
HALT
