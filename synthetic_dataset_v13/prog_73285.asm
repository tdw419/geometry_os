; DESCRIPTION: Composite: Sets a single black pixel at (303, 182) then Draws a white circle centered at (353, 155) with radius 72.
; PLAN: r0=303(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=155(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 353
LDI r6, 155
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
