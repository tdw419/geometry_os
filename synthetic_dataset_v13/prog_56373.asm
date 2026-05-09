; DESCRIPTION: Composite: Sets a single red pixel at (80, 48) then Creates a cyan circular shape at (440, 169) with radius 37.
; PLAN: r0=80(x), r1=48(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=169(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 48
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 440
LDI r6, 169
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
