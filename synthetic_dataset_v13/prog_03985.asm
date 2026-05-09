; DESCRIPTION: Composite: Sets a single yellow pixel at (107, 246) then Draws a white circle centered at (367, 127) with radius 49.
; PLAN: r0=107(x), r1=246(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=127(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 246
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 367
LDI r6, 127
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
