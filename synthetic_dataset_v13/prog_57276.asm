; DESCRIPTION: Composite: Sets a single red pixel at (274, 10) then Draws a yellow circle centered at (99, 175) with radius 14.
; PLAN: r0=274(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=175(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 99
LDI r6, 175
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
