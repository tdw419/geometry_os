; DESCRIPTION: Composite: Places a yellow dot at position (67, 201) then Creates a orange rectangular region at (409, 101) spanning 21 by 102 pixels.
; PLAN: r0=67(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=101(y), r7=21(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 409
LDI r6, 101
LDI r7, 21
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
