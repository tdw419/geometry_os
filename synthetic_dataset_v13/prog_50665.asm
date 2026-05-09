; DESCRIPTION: Composite: Draws a white circle centered at (135, 183) with radius 36 then Places a blue dot at position (83, 92).
; PLAN: r0=135(x), r1=183(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 183
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
