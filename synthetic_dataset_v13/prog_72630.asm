; DESCRIPTION: Composite: Places a cyan dot at position (466, 113) then Creates a white circular shape at (398, 109) with radius 23.
; PLAN: r0=466(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=109(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 113
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 109
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
