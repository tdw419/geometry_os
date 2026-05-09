; DESCRIPTION: Composite: Sets a single magenta pixel at (295, 66) then Creates a cyan circular shape at (285, 148) with radius 10.
; PLAN: r0=295(x), r1=66(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=148(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 66
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 285
LDI r6, 148
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
