; DESCRIPTION: Composite: Draws a cyan circle centered at (194, 121) with radius 77 then Places a yellow dot at position (235, 12).
; PLAN: r0=194(x), r1=121(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 121
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
