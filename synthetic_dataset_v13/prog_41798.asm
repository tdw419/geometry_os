; DESCRIPTION: Composite: Places a red dot at position (322, 62) then Creates a green circular shape at (442, 125) with radius 30.
; PLAN: r0=322(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=125(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 442
LDI r6, 125
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
