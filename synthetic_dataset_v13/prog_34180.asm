; DESCRIPTION: Composite: Sets a single magenta pixel at (283, 18) then Draws a magenta circle centered at (357, 164) with radius 68.
; PLAN: r0=283(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=164(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 283
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 164
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
