; DESCRIPTION: Composite: Places a green dot at position (347, 106) then Draws a white circle centered at (153, 44) with radius 21.
; PLAN: r0=347(x), r1=106(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=44(y), r7=21(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 106
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 153
LDI r6, 44
LDI r7, 21
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
