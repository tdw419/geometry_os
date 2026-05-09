; DESCRIPTION: Composite: Sets a single white pixel at (270, 111) then Creates a black rectangular region at (431, 155) spanning 61 by 26 pixels.
; PLAN: r0=270(x), r1=111(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=155(y), r7=61(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 111
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 155
LDI r7, 61
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
