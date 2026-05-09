; DESCRIPTION: Composite: Places a red dot at position (163, 167) then Places a red circle of radius 79 at center (412, 88).
; PLAN: r0=163(x), r1=167(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=88(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 167
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 412
LDI r6, 88
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
