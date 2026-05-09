; DESCRIPTION: Composite: Places a red dot at position (509, 47) then Creates a orange rectangular region at (486, 21) spanning 12 by 15 pixels.
; PLAN: r0=509(x), r1=47(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=486(x), r6=21(y), r7=12(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 47
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 486
LDI r6, 21
LDI r7, 12
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
