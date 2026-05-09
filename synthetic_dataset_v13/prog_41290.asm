; DESCRIPTION: Composite: Draws a white circle centered at (360, 136) with radius 57 then Places a yellow dot at position (225, 155).
; PLAN: r0=360(x), r1=136(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=155(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 136
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 155
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
