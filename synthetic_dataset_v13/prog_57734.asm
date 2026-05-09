; DESCRIPTION: Composite: Places a black dot at position (469, 115) then Draws a green circle centered at (364, 72) with radius 48.
; PLAN: r0=469(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=72(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 72
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
