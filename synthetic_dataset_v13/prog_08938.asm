; DESCRIPTION: Composite: Sets a single cyan pixel at (446, 173) then Creates a white circular shape at (189, 96) with radius 61.
; PLAN: r0=446(x), r1=173(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=96(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 446
LDI r1, 173
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 96
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
