; DESCRIPTION: Composite: Renders a magenta disk with center (366, 69) and radius 69 then Places a blue dot at position (141, 119).
; PLAN: r0=366(x), r1=69(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=119(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 69
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 119
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
