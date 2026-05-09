; DESCRIPTION: Composite: Places a orange dot at position (229, 67) then Creates a yellow rectangular region at (133, 148) spanning 100 by 24 pixels.
; PLAN: r0=229(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=148(y), r7=100(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 67
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 133
LDI r6, 148
LDI r7, 100
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
