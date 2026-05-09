; DESCRIPTION: Composite: Places a cyan dot at position (11, 120) then Draws a magenta circle centered at (347, 85) with radius 75.
; PLAN: r0=11(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=85(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 120
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 85
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
