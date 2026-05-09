; DESCRIPTION: Composite: Places a red dot at position (66, 247) then Draws a magenta circle centered at (129, 68) with radius 10.
; PLAN: r0=66(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=68(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 129
LDI r6, 68
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
