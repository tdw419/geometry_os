; DESCRIPTION: Composite: Places a orange dot at position (129, 119) then Creates a magenta rectangular region at (139, 3) spanning 10 by 88 pixels.
; PLAN: r0=129(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=3(y), r7=10(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 139
LDI r6, 3
LDI r7, 10
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
