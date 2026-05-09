; DESCRIPTION: Composite: Creates a blue circular shape at (384, 134) with radius 57 then Sets a single red pixel at (357, 27).
; PLAN: r0=384(x), r1=134(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=27(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 134
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 27
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
