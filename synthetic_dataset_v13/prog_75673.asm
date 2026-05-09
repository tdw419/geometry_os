; DESCRIPTION: Composite: Places a black dot at position (169, 92) then Draws a orange circle centered at (388, 124) with radius 75.
; PLAN: r0=169(x), r1=92(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=124(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 92
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 124
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
