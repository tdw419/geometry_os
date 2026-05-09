; DESCRIPTION: Composite: Sets a single yellow pixel at (439, 82) then Draws a white circle centered at (302, 162) with radius 32.
; PLAN: r0=439(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=162(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 302
LDI r6, 162
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
