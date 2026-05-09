; DESCRIPTION: Composite: Sets a single black pixel at (308, 105) then Draws a white circle centered at (371, 62) with radius 31.
; PLAN: r0=308(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=62(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 62
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
