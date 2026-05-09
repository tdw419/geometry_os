; DESCRIPTION: Composite: Places a blue dot at position (170, 15) then Draws a blue circle centered at (189, 202) with radius 48.
; PLAN: r0=170(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=202(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 202
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
