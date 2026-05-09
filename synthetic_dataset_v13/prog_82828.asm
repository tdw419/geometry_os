; DESCRIPTION: Composite: Places a orange dot at position (235, 175) then Draws a green circle centered at (121, 77) with radius 31.
; PLAN: r0=235(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=77(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 121
LDI r6, 77
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
