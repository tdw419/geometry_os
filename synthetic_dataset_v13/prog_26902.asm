; DESCRIPTION: Composite: Sets a single orange pixel at (386, 121) then Creates a white circular shape at (431, 134) with radius 79.
; PLAN: r0=386(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=134(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 386
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 431
LDI r6, 134
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
