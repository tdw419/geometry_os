; DESCRIPTION: Composite: Places a green dot at position (321, 55) then Draws a purple circle centered at (339, 97) with radius 74.
; PLAN: r0=321(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=97(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 339
LDI r6, 97
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
