; DESCRIPTION: Composite: Places a orange dot at position (343, 167) then Creates a blue rectangular region at (1, 58) spanning 82 by 27 pixels.
; PLAN: r0=343(x), r1=167(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=58(y), r7=82(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 167
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 1
LDI r6, 58
LDI r7, 82
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
