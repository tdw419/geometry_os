; DESCRIPTION: Composite: Sets a single white pixel at (428, 125) then Draws a magenta circle centered at (260, 134) with radius 53.
; PLAN: r0=428(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=134(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 134
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
