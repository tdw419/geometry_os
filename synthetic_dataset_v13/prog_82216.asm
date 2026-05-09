; DESCRIPTION: Composite: Places a purple dot at position (228, 105) then Draws a magenta circle centered at (420, 166) with radius 53.
; PLAN: r0=228(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=166(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 166
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
