; DESCRIPTION: Composite: Places a black dot at position (62, 112) then Draws a yellow circle centered at (290, 171) with radius 37.
; PLAN: r0=62(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=171(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 62
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 290
LDI r6, 171
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
