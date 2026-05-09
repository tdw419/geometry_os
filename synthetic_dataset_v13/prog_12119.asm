; DESCRIPTION: Composite: Places a blue dot at position (394, 227) then Creates a orange rectangular region at (405, 139) spanning 88 by 79 pixels.
; PLAN: r0=394(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=139(y), r7=88(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 139
LDI r7, 88
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
