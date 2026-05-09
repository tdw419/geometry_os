; DESCRIPTION: Composite: Sets a single orange pixel at (477, 6) then Draws a red circle centered at (302, 202) with radius 18.
; PLAN: r0=477(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=202(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 302
LDI r6, 202
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
