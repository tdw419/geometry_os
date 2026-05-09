; DESCRIPTION: Composite: Sets a single orange pixel at (311, 166) then Draws a white circle centered at (60, 103) with radius 52.
; PLAN: r0=311(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=103(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 60
LDI r6, 103
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
