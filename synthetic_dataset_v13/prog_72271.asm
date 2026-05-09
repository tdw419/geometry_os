; DESCRIPTION: Composite: Renders a orange disk with center (250, 146) and radius 75 then Places a black dot at position (411, 141).
; PLAN: r0=250(x), r1=146(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=141(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 146
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 141
LDI r7, 0x000000
PSET r5, r6, r7
HALT
