; DESCRIPTION: Composite: Sets a single black pixel at (181, 189) then Renders a orange disk with center (175, 165) and radius 61.
; PLAN: r0=181(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=165(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 175
LDI r6, 165
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
