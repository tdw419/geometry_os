; DESCRIPTION: Composite: Sets a single orange pixel at (402, 108) then Draws a green circle centered at (235, 81) with radius 59.
; PLAN: r0=402(x), r1=108(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=81(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 108
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 235
LDI r6, 81
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
