; DESCRIPTION: Composite: Places a orange dot at position (148, 192) then Creates a blue rectangular region at (147, 218) spanning 119 by 26 pixels.
; PLAN: r0=148(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=218(y), r7=119(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 192
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 147
LDI r6, 218
LDI r7, 119
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
