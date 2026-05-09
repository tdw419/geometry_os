; DESCRIPTION: Composite: Places a yellow dot at position (459, 76) then Creates a red circular shape at (295, 43) with radius 40.
; PLAN: r0=459(x), r1=76(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=43(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 459
LDI r1, 76
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 43
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
