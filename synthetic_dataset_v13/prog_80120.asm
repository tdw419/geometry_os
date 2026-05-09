; DESCRIPTION: Composite: Sets a single magenta pixel at (290, 97) then Creates a green circular shape at (52, 49) with radius 20.
; PLAN: r0=290(x), r1=97(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=49(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 97
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 49
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
