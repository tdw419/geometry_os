; DESCRIPTION: Composite: Places a cyan dot at position (125, 191) then Draws a white circle centered at (245, 48) with radius 32.
; PLAN: r0=125(x), r1=191(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=48(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 191
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 48
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
