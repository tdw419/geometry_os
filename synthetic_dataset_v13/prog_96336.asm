; DESCRIPTION: Composite: Draws a blue circle centered at (298, 137) with radius 45 then Places a yellow dot at position (138, 131).
; PLAN: r0=298(x), r1=137(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=131(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 137
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 131
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
