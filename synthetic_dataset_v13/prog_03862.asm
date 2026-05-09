; DESCRIPTION: Composite: Draws a red circle centered at (278, 51) with radius 32 then Places a yellow dot at position (303, 194).
; PLAN: r0=278(x), r1=51(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=194(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 51
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 194
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
