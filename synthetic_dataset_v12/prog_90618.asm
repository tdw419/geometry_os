; DESCRIPTION: Composite: Places a blue dot at position (56, 64) then Creates a blue circular shape at (236, 66) with radius 35.
; PLAN: r0=56(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=66(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 66
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
