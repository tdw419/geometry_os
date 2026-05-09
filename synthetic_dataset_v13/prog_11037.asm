; DESCRIPTION: Composite: Places a red dot at position (101, 196) then Creates a black circular shape at (222, 164) with radius 57.
; PLAN: r0=101(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=164(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 101
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 222
LDI r6, 164
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
