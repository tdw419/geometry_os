; DESCRIPTION: Composite: Creates a white circular shape at (135, 62) with radius 19 then Sets a single green pixel at (68, 21).
; PLAN: r0=135(x), r1=62(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=21(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 62
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 21
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
