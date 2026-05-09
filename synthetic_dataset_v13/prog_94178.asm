; DESCRIPTION: Composite: Places a red dot at position (334, 245) then Creates a black rectangular region at (166, 140) spanning 104 by 78 pixels.
; PLAN: r0=334(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=140(y), r7=104(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 166
LDI r6, 140
LDI r7, 104
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
