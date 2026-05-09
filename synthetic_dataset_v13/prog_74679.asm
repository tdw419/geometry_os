; DESCRIPTION: Composite: Places a green dot at position (482, 39) then Creates a white circular shape at (131, 87) with radius 66.
; PLAN: r0=482(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=87(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 131
LDI r6, 87
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
