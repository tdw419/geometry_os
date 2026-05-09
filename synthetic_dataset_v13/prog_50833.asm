; DESCRIPTION: Composite: Places a yellow dot at position (360, 151) then Draws a white circle centered at (358, 114) with radius 19.
; PLAN: r0=360(x), r1=151(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=114(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 151
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 358
LDI r6, 114
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
