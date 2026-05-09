; DESCRIPTION: Composite: Places a blue dot at position (156, 18) then Creates a black circular shape at (135, 149) with radius 22.
; PLAN: r0=156(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=149(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 149
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
