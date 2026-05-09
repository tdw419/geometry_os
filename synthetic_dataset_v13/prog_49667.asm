; DESCRIPTION: Composite: Places a white dot at position (137, 92) then Draws a yellow circle centered at (248, 80) with radius 74.
; PLAN: r0=137(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=80(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 80
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
