; DESCRIPTION: Composite: Sets a single orange pixel at (490, 116) then Creates a white rectangular region at (166, 43) spanning 69 by 104 pixels.
; PLAN: r0=490(x), r1=116(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=43(y), r7=69(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 116
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 166
LDI r6, 43
LDI r7, 69
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
