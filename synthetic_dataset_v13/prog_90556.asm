; DESCRIPTION: Composite: Places a yellow dot at position (358, 140) then Draws a white circle centered at (151, 47) with radius 35.
; PLAN: r0=358(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=47(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 151
LDI r6, 47
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
