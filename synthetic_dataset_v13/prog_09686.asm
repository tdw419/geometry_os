; DESCRIPTION: Composite: Sets a single green pixel at (0, 197) then Draws a yellow circle centered at (216, 92) with radius 71.
; PLAN: r0=0(x), r1=197(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=92(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 197
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 216
LDI r6, 92
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
