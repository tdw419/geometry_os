; DESCRIPTION: Composite: Places a blue dot at position (143, 167) then Places a black circle of radius 35 at center (125, 193).
; PLAN: r0=143(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=193(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 193
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
