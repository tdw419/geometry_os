; DESCRIPTION: Composite: Creates a magenta circular shape at (98, 79) with radius 39 then Sets a single white pixel at (357, 144).
; PLAN: r0=98(x), r1=79(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=144(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 79
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 144
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
