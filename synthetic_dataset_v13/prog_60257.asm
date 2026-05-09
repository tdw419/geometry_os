; DESCRIPTION: Composite: Sets a single black pixel at (368, 68) then Renders a red disk with center (311, 148) and radius 29.
; PLAN: r0=368(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=148(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 311
LDI r6, 148
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
