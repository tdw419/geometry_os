; DESCRIPTION: Composite: Places a cyan dot at position (487, 183) then Draws a magenta circle centered at (296, 110) with radius 36.
; PLAN: r0=487(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=110(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 487
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 110
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
