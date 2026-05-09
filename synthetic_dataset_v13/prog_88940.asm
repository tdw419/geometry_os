; DESCRIPTION: Composite: Sets a single white pixel at (28, 162) then Places a orange circle of radius 62 at center (427, 174).
; PLAN: r0=28(x), r1=162(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=174(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 162
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 174
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
