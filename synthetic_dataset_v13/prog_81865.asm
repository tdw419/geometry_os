; DESCRIPTION: Composite: Places a red dot at position (105, 218) then Draws a red circle centered at (100, 125) with radius 61.
; PLAN: r0=105(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=125(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 100
LDI r6, 125
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
