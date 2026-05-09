; DESCRIPTION: Composite: Sets a single black pixel at (319, 52) then Creates a black rectangular region at (364, 44) spanning 33 by 112 pixels.
; PLAN: r0=319(x), r1=52(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=44(y), r7=33(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 52
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 44
LDI r7, 33
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
