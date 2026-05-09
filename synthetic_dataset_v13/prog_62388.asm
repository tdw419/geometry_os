; DESCRIPTION: Composite: Sets a single blue pixel at (492, 199) then Creates a purple rectangular region at (357, 19) spanning 62 by 39 pixels.
; PLAN: r0=492(x), r1=199(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=19(y), r7=62(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 199
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 19
LDI r7, 62
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
