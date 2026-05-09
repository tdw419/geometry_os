; DESCRIPTION: Composite: Places a orange dot at position (135, 94) then Creates a white circular shape at (264, 72) with radius 52.
; PLAN: r0=135(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=72(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 264
LDI r6, 72
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
