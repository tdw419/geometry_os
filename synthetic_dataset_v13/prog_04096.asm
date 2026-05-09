; DESCRIPTION: Composite: Sets a single orange pixel at (283, 59) then Creates a cyan circular shape at (396, 47) with radius 33.
; PLAN: r0=283(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=47(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 283
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 396
LDI r6, 47
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
