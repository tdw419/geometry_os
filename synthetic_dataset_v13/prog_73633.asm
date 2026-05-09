; DESCRIPTION: Composite: Places a red circle of radius 22 at center (324, 136) then Places a red dot at position (144, 51).
; PLAN: r0=324(x), r1=136(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=51(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 136
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 51
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
