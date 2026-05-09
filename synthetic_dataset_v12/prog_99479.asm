; DESCRIPTION: Composite: Places a magenta circle of radius 76 at center (166, 142) then Places a blue dot at position (366, 159).
; PLAN: r0=166(x), r1=142(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x), r6=159(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 142
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 159
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
