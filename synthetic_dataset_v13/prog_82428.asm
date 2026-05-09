; DESCRIPTION: Composite: Renders a orange disk with center (272, 111) and radius 49 then Sets a single white pixel at (406, 122).
; PLAN: r0=272(x), r1=111(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=122(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 111
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 122
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
