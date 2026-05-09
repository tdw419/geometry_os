; DESCRIPTION: Composite: Sets a single blue pixel at (13, 251) then Creates a yellow rectangular region at (399, 21) spanning 69 by 108 pixels.
; PLAN: r0=13(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=21(y), r7=69(width), r8=108(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 21
LDI r7, 69
LDI r8, 108
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
