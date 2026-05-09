; DESCRIPTION: Composite: Places a green dot at position (417, 147) then Draws a yellow circle centered at (301, 177) with radius 14.
; PLAN: r0=417(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=177(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 147
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 177
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
