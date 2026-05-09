; DESCRIPTION: Composite: Sets a single red pixel at (376, 76) then Creates a orange rectangular region at (280, 165) spanning 87 by 90 pixels.
; PLAN: r0=376(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=165(y), r7=87(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 165
LDI r7, 87
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
