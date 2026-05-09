; DESCRIPTION: Composite: Places a white dot at position (318, 68) then Creates a yellow rectangular region at (315, 114) spanning 75 by 81 pixels.
; PLAN: r0=318(x), r1=68(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=114(y), r7=75(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 68
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 114
LDI r7, 75
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
