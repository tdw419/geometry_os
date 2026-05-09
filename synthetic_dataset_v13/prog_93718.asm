; DESCRIPTION: Composite: Places a white dot at position (239, 234) then Creates a red circular shape at (172, 183) with radius 48.
; PLAN: r0=239(x), r1=234(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=183(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 234
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 172
LDI r6, 183
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
