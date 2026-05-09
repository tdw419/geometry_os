; DESCRIPTION: Composite: Sets a single white pixel at (507, 189) then Renders a orange disk with center (163, 162) and radius 44.
; PLAN: r0=507(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=162(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 162
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
