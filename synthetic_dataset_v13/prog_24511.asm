; DESCRIPTION: Composite: Places a blue dot at position (148, 13) then Creates a blue rectangular region at (258, 101) spanning 45 by 109 pixels.
; PLAN: r0=148(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=101(y), r7=45(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 101
LDI r7, 45
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
