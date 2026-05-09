; DESCRIPTION: Composite: Creates a black rectangular region at (373, 45) spanning 10 by 84 pixels then Sets a single white pixel at (422, 129).
; PLAN: r0=373(x), r1=45(y), r2=10(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=129(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 45
LDI r2, 10
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 129
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
