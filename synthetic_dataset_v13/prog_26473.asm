; DESCRIPTION: Composite: Sets a single white pixel at (360, 188) then Draws a yellow circle centered at (62, 96) with radius 43.
; PLAN: r0=360(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=96(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 96
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
