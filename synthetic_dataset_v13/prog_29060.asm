; DESCRIPTION: Composite: Places a black dot at position (304, 220) then Draws a yellow circle centered at (478, 197) with radius 22.
; PLAN: r0=304(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=197(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 478
LDI r6, 197
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
