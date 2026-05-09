; DESCRIPTION: Composite: Sets a single orange pixel at (308, 55) then Creates a green circular shape at (202, 88) with radius 14.
; PLAN: r0=308(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=88(y), r7=14(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 55
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 202
LDI r6, 88
LDI r7, 14
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
