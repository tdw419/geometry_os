; DESCRIPTION: Composite: Sets a single yellow pixel at (206, 143) then Creates a white circular shape at (394, 127) with radius 63.
; PLAN: r0=206(x), r1=143(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=127(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 143
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 394
LDI r6, 127
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
