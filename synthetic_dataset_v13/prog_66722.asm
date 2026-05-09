; DESCRIPTION: Composite: Sets a single orange pixel at (127, 95) then Creates a yellow circular shape at (267, 146) with radius 69.
; PLAN: r0=127(x), r1=95(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=146(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 95
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 267
LDI r6, 146
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
