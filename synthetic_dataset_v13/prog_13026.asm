; DESCRIPTION: Composite: Places a magenta dot at position (93, 96) then Draws a magenta circle centered at (73, 214) with radius 19.
; PLAN: r0=93(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=214(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 214
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
