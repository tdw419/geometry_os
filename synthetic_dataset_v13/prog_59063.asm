; DESCRIPTION: Composite: Places a white dot at position (34, 230) then Creates a orange rectangular region at (374, 71) spanning 77 by 56 pixels.
; PLAN: r0=34(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=71(y), r7=77(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 71
LDI r7, 77
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
