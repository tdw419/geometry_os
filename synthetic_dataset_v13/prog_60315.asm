; DESCRIPTION: Composite: Places a green dot at position (58, 17) then Draws a cyan circle centered at (475, 128) with radius 26.
; PLAN: r0=58(x), r1=17(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=475(x), r6=128(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 17
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 475
LDI r6, 128
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
