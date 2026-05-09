; DESCRIPTION: Composite: Places a blue dot at position (325, 45) then Creates a black rectangular region at (228, 72) spanning 69 by 83 pixels.
; PLAN: r0=325(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=72(y), r7=69(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 228
LDI r6, 72
LDI r7, 69
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
