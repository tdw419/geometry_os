; DESCRIPTION: Composite: Places a white dot at position (28, 229) then Creates a white circular shape at (237, 86) with radius 15.
; PLAN: r0=28(x), r1=229(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=86(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 229
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 86
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
