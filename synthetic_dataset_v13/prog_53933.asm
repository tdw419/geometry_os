; DESCRIPTION: Composite: Creates a red circular shape at (163, 62) with radius 51 then Places a green dot at position (355, 71).
; PLAN: r0=163(x), r1=62(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=71(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 62
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 71
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
