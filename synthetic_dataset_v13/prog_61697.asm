; DESCRIPTION: Composite: Places a blue dot at position (45, 22) then Draws a red circle centered at (156, 73) with radius 47.
; PLAN: r0=45(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=73(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 73
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
