; DESCRIPTION: Composite: Places a green dot at position (287, 98) then Draws a white circle centered at (316, 136) with radius 38.
; PLAN: r0=287(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=136(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 316
LDI r6, 136
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
