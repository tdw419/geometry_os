; DESCRIPTION: Composite: Sets a single magenta pixel at (370, 47) then Draws a magenta circle centered at (448, 90) with radius 62.
; PLAN: r0=370(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=90(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 47
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 90
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
