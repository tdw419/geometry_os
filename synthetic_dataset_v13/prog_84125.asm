; DESCRIPTION: Composite: Sets a single purple pixel at (352, 97) then Creates a orange rectangular region at (134, 12) spanning 39 by 13 pixels.
; PLAN: r0=352(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=12(y), r7=39(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 12
LDI r7, 39
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
