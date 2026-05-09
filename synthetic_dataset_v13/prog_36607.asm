; DESCRIPTION: Composite: Sets a single magenta pixel at (129, 240) then Creates a blue rectangular region at (441, 72) spanning 51 by 61 pixels.
; PLAN: r0=129(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=72(y), r7=51(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 72
LDI r7, 51
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
